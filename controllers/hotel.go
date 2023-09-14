package controllers

import (
	"BeeGoTaskW3E/models"
	"encoding/json"
	"fmt"
	"io"
	"net/http"

	beego "github.com/beego/beego/v2/server/web"
)

func fetchHotel(data models.HotelData) {
	baseURL := "https://booking-com13.p.rapidapi.com/stays/properties/list-v2?location=%s&checkin_date=%s&checkout_date=%s&language_code=en-us&currency_code=USD"
	url := fmt.Sprintf(baseURL, data.Location, data.StartDate, data.EndDate)
	print(url)

	req, _ := http.NewRequest("GET", url, nil)
	req.Header.Add("X-RapidAPI-Key", "5edba99934msh65cfd2d65b8987ap11e232jsneeea5dee9112")
	req.Header.Add("X-RapidAPI-Host", "booking-com13.p.rapidapi.com")
	res, _ := http.DefaultClient.Do(req)
	defer res.Body.Close()

	body, _ := io.ReadAll(res.Body)
	jsonString := string(body)

	data.JsonChan <- jsonString
}

type HotelController struct {
	beego.Controller
}

func (c *HotelController) Get() {
	location := c.GetString("location")
	hotelCheckInDate := c.GetString("hotelCheckInDate")
	hotelCheckOutDate := c.GetString("hotelCheckOutDate")

	if location != "" && hotelCheckInDate != "" && hotelCheckOutDate != "" {
		data := models.HotelStruct{}
		jsonChan := make(chan string)
		hotelData := models.HotelData{}
		hotelData.Location = location
		hotelData.StartDate = hotelCheckInDate
		hotelData.EndDate = hotelCheckOutDate
		hotelData.JsonChan = jsonChan
		hotelData.ErrorChan = make(chan error)

		go fetchHotel(hotelData)
		jsonString := <-jsonChan

		err := json.Unmarshal([]byte(jsonString), &data)
		if err != nil {
			c.Data["error"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.TplName = "error.tpl"
			return
		} else if len(data.Data) == 0 {
			c.Data["error"] = models.ErrorMessage{
				Message:    "No hotels found",
				SubMessage: "Please prodive location and dates properly",
				Code:       500,
			}
			c.TplName = "error.tpl"
			return
		}

		hotelData.Location = location
		hotelData.StartDate = hotelCheckInDate
		hotelData.EndDate = hotelCheckOutDate
		hotelData.Hotels = []models.Hotel{}

		for _, v := range data.Data {
			hotel := models.Hotel{}
			hotel.Id = v.BasicPropertyData.ID
			hotel.IdDetail = v.IdDetail
			hotel.Name = v.DisplayName.Text
			hotel.Location = v.BasicPropertyData.Location.Address
			hotel.City = v.BasicPropertyData.Location.City
			hotel.Photo = "https://cf.bstatic.com" + v.BasicPropertyData.Photos.Main.HighResJpegUrl.RelativeUrl
			hotel.Reviews = v.BasicPropertyData.Reviews.ReviewsCount
			hotel.Rating = v.BasicPropertyData.StarRating.Value
			hotel.Price = fmt.Sprintf("%.2f", v.Blocks[0].FinalPrice.Amount)
			hotel.Currency = v.Blocks[0].FinalPrice.Currency
			hotel.FreeCancellationUntil = v.Blocks[0].FreeCancellationUntil
			hotel.Bed = v.MatchingUnitConfigurations.CommonConfiguration.NbBedrooms
			hotel.Kitchen = v.MatchingUnitConfigurations.CommonConfiguration.NbKitchens
			hotel.Livingroom = v.MatchingUnitConfigurations.CommonConfiguration.NbLivingrooms
			hotel.Pool = v.MatchingUnitConfigurations.CommonConfiguration.NbPools
			hotel.NonStarRating = 5 - v.BasicPropertyData.StarRating.Value
			hotelData.Hotels = append(hotelData.Hotels, hotel)
		}

		c.Data["Hotels"] = hotelData.Hotels
		c.TplName = "hotel.tpl"
	} else {
		c.Data["error"] = models.ErrorMessage{
			Message:    "No hotels found",
			SubMessage: "Please prodive location and dates properly",
			Code:       500,
		}
		c.TplName = "error.tpl"
	}

}

type SearchHotelController struct {
	beego.Controller
}

func (c *SearchHotelController) Get() {
	location := c.GetString("location")
	hotelCheckInDate := c.GetString("hotelCheckInDate")
	hotelCheckOutDate := c.GetString("hotelCheckOutDate")

	if location != "" && hotelCheckInDate != "" && hotelCheckOutDate != "" {
		jsonChan := make(chan string)
		errorChan := make(chan error)
		hotelData := models.HotelData{}
		hotelData.Location = location
		hotelData.StartDate = hotelCheckInDate
		hotelData.EndDate = hotelCheckOutDate
		hotelData.JsonChan = jsonChan
		hotelData.ErrorChan = errorChan

		go fetchHotel(hotelData)
		jsonString := <-jsonChan

		err := json.Unmarshal([]byte(jsonString), &hotelData)
		if err != nil {
			c.Data["error"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.TplName = "error.tpl"

		} else {
			c.Redirect("/hotel", 302)
		}

	}
	c.ServeJSON()
}

type HotelDetailsController struct {
	beego.Controller
}

func (c *HotelDetailsController) Get() {
	param := c.Ctx.Request.RequestURI
	param = param[14:]
	fmt.Println(param)
	c.TplName = "hotel-detail.tpl"
}
