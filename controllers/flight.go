package controllers

import (
	"BeeGoTaskW3E/models"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"

	beego "github.com/beego/beego/v2/server/web"
)

func fetchFlight(data models.FlightData) {
	baseURL := "https://booking-com13.p.rapidapi.com/flights/return?location_from=%s&location_to=%s&departure_date=%s&return_date=%s&page=1&country_flag=us"
	url := fmt.Sprintf(baseURL, data.Origin, data.Destination, data.Departure, data.Return)
	print(url)

	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Add("X-RapidAPI-Key", "ba649e048bmsh7ad4f3caa0a03acp1b0912jsnf28f9b55b322")
	req.Header.Add("X-RapidAPI-Host", "booking-com13.p.rapidapi.com")
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

	if origin == "" || destination == "" || departureDate == "" || returnDate == "" {
		c.TplName = "flight.tpl"
	} else {
		data := models.FlightStruct{}
		jsonChan := make(chan string)
		flightData := models.FlightData{}
		flightData.Origin = origin
		flightData.Destination = destination
		flightData.Departure = departureDate
		flightData.Return = returnDate
		flightData.JsonChan = jsonChan
		flightData.ErrorChan = make(chan error)

		go fetchFlight(flightData)
		jsonString := <-jsonChan

		err := json.Unmarshal([]byte(jsonString), &data)
		if err != nil {
			c.Data["error"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.TplName = "error.tpl"
		} else if len(data.FlightStruct.Flights) == 0 {
			c.Data["Error"] = models.ErrorMessage{
				Message:    "No flights found",
				SubMessage: "Please prodive location and dates properly",
				Code:       500,
			}
			c.TplName = "error.tpl"
			return
		}

		flightData.Origin = c.GetString("location_from")
		flightData.Destination = c.GetString("location_to")
		flightData.Departure = departureDate
		flightData.Return = returnDate
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
		c.Data["Flight"] = flightData
		c.TplName = "flight.tpl"
	}
}

type SearchFlightController struct {
	beego.Controller
}

func (c *SearchFlightController) Get() {
	origin := url.QueryEscape(c.GetString("location_from"))
	destination := url.QueryEscape(c.GetString("location_to"))
	departureDate := c.GetString("departure_date")
	returnDate := c.GetString("return_date")
	if origin != "" && destination != "" && departureDate != "" && returnDate != "" {
		data := models.FlightStruct{}
		jsonChan := make(chan string)
		flightData := models.FlightData{}
		flightData.Origin = origin
		flightData.Destination = destination
		flightData.Departure = departureDate
		flightData.Return = returnDate
		flightData.JsonChan = jsonChan
		flightData.ErrorChan = make(chan error)

		go fetchFlight(flightData)
		jsonString := <-jsonChan

		err := json.Unmarshal([]byte(jsonString), &data)
		if err != nil {
			fmt.Println("Error unmarshaling JSON:", err)
		}
		c.Data["json"] = data
	}
	c.ServeJSON()
}
