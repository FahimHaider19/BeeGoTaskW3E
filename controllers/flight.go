package controllers

import (
	"BeeGoTaskW3E/global"
	"BeeGoTaskW3E/models"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"time"

	beego "github.com/beego/beego/v2/server/web"
)

func fetchFlight(data models.FlightData) {
	url := ""
	if data.Type == "one-way" {
		baseUrl := "https://booking-com13.p.rapidapi.com/flights/one-way?location_from=%s&location_to=%s&departure_date=%s&page=1&country_flag=us"
		url = fmt.Sprintf(baseUrl, data.Origin, data.Destination, data.Departure)
	} else if data.Type == "return" {
		baseURL := "https://booking-com13.p.rapidapi.com/flights/return?location_from=%s&location_to=%s&departure_date=%s&return_date=%s&page=1&country_flag=us"
		url = fmt.Sprintf(baseURL, data.Origin, data.Destination, data.Departure, data.Return)
	}
	print(url)

	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Add("X-RapidAPI-Key", global.XRapidAPIKey)
	req.Header.Add("X-RapidAPI-Host", global.XRapidAPIHost)
	res, _ := http.DefaultClient.Do(req)
	defer res.Body.Close()

	body, _ := io.ReadAll(res.Body)
	jsonString := string(body)

	data.JsonChan <- jsonString
}

type FlightController struct {
	beego.Controller
}

func (c *FlightController) Get() {
	origin := url.QueryEscape(c.GetString("location_from"))
	destination := url.QueryEscape(c.GetString("location_to"))
	departureDate := c.GetString("departure_date")
	returnDate := c.GetString("return_date")
	flightType := c.GetString("type")
	key := "F:" + origin + destination + departureDate + returnDate + flightType
	exist := global.Cached.IsExist(key)
	fmt.Println(global.Cached)
	fmt.Println(global.Cached.Get(key))

	if origin == "" || destination == "" || departureDate == "" || flightType == "" || (flightType == "return" && returnDate == "") {
		var subMessage string
		if flightType == "return" {
			subMessage = "Input field: From(Location), To(Location), Departure, Return Date, Flight Type cannot be empty."
		} else {
			subMessage = "Input field: From(Location), To(Location), Departure, Flight Type cannot be empty."
		}

		c.Data["json"] = models.ErrorMessage{
			Message:    "Fields are empty",
			SubMessage: subMessage,
			Code:       500,
		}
	} else if exist {
		c.Data["json"] = global.Cached.Get(key)
	} else {
		data := models.FlightStruct{}
		jsonChan := make(chan string)
		flightData := models.FlightData{}
		flightData.Origin = origin
		flightData.Destination = destination
		flightData.Departure = departureDate
		flightData.Return = returnDate
		flightData.Type = flightType
		flightData.JsonChan = jsonChan
		flightData.ErrorChan = make(chan error)

		go fetchFlight(flightData)
		jsonString := <-jsonChan

		err := json.Unmarshal([]byte(jsonString), &data)
		if err != nil {
			c.Data["json"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.ServeJSON()
		} else if len(data.FlightStruct.Flights) == 0 {
			c.Data["json"] = models.ErrorMessage{
				Message:    "No flights found",
				SubMessage: "Please prodive location and dates properly",
				Code:       400,
			}
			c.ServeJSON()
		}

		flightData.Origin = c.GetString("location_from")
		flightData.Destination = c.GetString("location_to")
		flightData.Departure = departureDate
		flightData.Type = returnDate
		flightData.Flights = []models.FlightInfo{}

		for _, v := range data.FlightStruct.Flights {
			flightInfo := models.FlightInfo{}
			flightInfo.Id = v.ID
			flightInfo.Url = v.ShareableURL

			if len(v.TravelerPrices) > 0 {
				flightInfo.Price = v.TravelerPrices[0].Price.Price.Value
				flightInfo.Vat = v.TravelerPrices[0].Price.VAT.Value
				flightInfo.Currency = v.TravelerPrices[0].Price.Price.Currency.Code
			}

			if len(v.AvailableExtraProducts) > 0 &&
				len(v.AvailableExtraProducts[0].SellSpecification.SellPriceBaggage) > 0 {
				flightInfo.MaxWeight = v.AvailableExtraProducts[0].SellSpecification.SellPriceBaggage[0].MaxWeight
				flightInfo.NumberOfUnits = v.AvailableExtraProducts[0].SellSpecification.SellPriceBaggage[0].NumberOfUnits
			}

			flightData.Flights = append(flightData.Flights, flightInfo)
		}

		global.Cached.Put(key, flightData.Flights, 300*time.Second)
		c.Data["json"] = flightData.Flights
	}
	c.ServeJSON()
}

type SearchFlightController struct {
	beego.Controller
}

func (c *SearchFlightController) Get() {
	origin := url.QueryEscape(c.GetString("location_from"))
	destination := url.QueryEscape(c.GetString("location_to"))
	departureDate := c.GetString("departure_date")
	returnDate := c.GetString("return_date")
	flightType := c.GetString("type")
	key := "FD:" + origin + destination + departureDate + returnDate + flightType
	exist := global.Cached.IsExist(key)

	if origin == "" || destination == "" || departureDate == "" || (flightType == "return" && returnDate == "") {
		c.Data["json"] = models.ErrorMessage{
			Message:    "Fields are empty",
			SubMessage: "Input field: From(Location), To(Location), Departure, Return Date, Flight Type cannot be empty.",
			Code:       500,
		}
	} else if exist {
		c.Data["json"] = global.Cached.Get(key)
	} else {
		data := models.FlightStruct{}
		jsonChan := make(chan string)
		flightData := models.FlightData{}
		flightData.Origin = origin
		flightData.Destination = destination
		flightData.Departure = departureDate
		flightData.Return = returnDate
		flightData.Type = flightType
		flightData.JsonChan = jsonChan
		flightData.ErrorChan = make(chan error)

		go fetchFlight(flightData)
		jsonString := <-jsonChan

		err := json.Unmarshal([]byte(jsonString), &data)
		if err != nil {
			c.Data["json"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
		}
		c.Data["json"] = data
		global.Cached.Put(key, flightData.Flights, 300*time.Second)
	}
	c.ServeJSON()
}
