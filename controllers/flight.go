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

func fetchFlight(origin string, destination string, departureDate string, returnDate string) string {

	baseURL := "https://booking-com13.p.rapidapi.com/flights/return?location_from=%s&location_to=%s&departure_date=%s&return_date=%s&page=1&country_flag=us"

	url := fmt.Sprintf(baseURL, origin, destination, departureDate, returnDate)
	print(url)

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("X-RapidAPI-Key", "5edba99934msh65cfd2d65b8987ap11e232jsneeea5dee9112")
	req.Header.Add("X-RapidAPI-Host", "booking-com13.p.rapidapi.com")

	res, _ := http.DefaultClient.Do(req)
	// data := res.Body

	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)
	jsonString := string(body)
	// err := json.Unmarshal([]byte(jsonString), &data)

	// if err != nil {
	// 	fmt.Println("Error unmarshaling JSON:", err)
	// 	return data
	// }

	// return data
	// fmt.Println(body)
	// fmt.Print(jsonString)
	// fmt.Println(string(body))

	return jsonString
}

type FlightController struct {
	beego.Controller
}

func (c *FlightController) Get() {
	data := models.Data{}
	origin := url.QueryEscape(c.GetString("location_from"))
	destination := url.QueryEscape(c.GetString("location_to"))
	departureDate := c.GetString("departure_date")
	returnDate := c.GetString("return_date")
	if origin == "" || destination == "" || departureDate == "" || returnDate == "" {
		c.TplName = "flight.tpl"
	} else {
		jsonString := fetchFlight(origin, destination, departureDate, returnDate)

		err := json.Unmarshal([]byte(jsonString), &data)
		if err != nil {
			fmt.Println("Error unmarshaling JSON:", err)
		}
		c.TplName = "flight.tpl"
	}
}

type SearchFlightController struct {
	beego.Controller
}

func (c *SearchFlightController) Get() {
	// Data := map[string]interface{}{
	// 	"message": "This is a JSON response",
	// 	"status":  "success",
	// }

	origin := url.QueryEscape(c.GetString("location_from"))
	destination := url.QueryEscape(c.GetString("location_to"))
	departureDate := c.GetString("departure_date")
	returnDate := c.GetString("return_date")
	if origin != "" && destination != "" && departureDate != "" && returnDate != "" {
		print(origin, destination, departureDate, returnDate)
		jsonString := fetchFlight(origin, destination, departureDate, returnDate)
		c.Data["json"] = jsonString
	}
	c.ServeJSON()
}
