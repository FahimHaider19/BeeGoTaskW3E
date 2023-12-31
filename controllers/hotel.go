package controllers

import (
	"BeeGoTaskW3E/global"
	"BeeGoTaskW3E/models"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"strings"
	"time"

	beego "github.com/beego/beego/v2/server/web"
)

func fetchHotel(data models.HotelData) {
	baseURL := "https://booking-com13.p.rapidapi.com/stays/properties/list-v2?location=%s&checkin_date=%s&checkout_date=%s&language_code=en-us&currency_code=USD"
	url := fmt.Sprintf(baseURL, data.Location, data.StartDate, data.EndDate)
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

type HotelController struct {
	beego.Controller
}

func (c *HotelController) Get() {
	location := c.GetString("location")
	hotelCheckInDate := c.GetString("hotelCheckInDate")
	hotelCheckOutDate := c.GetString("hotelCheckOutDate")
	key := "H:" + location + hotelCheckInDate + hotelCheckOutDate
	exist := global.Cached.IsExist(key)

	if location == "" && hotelCheckInDate == "" && hotelCheckOutDate == "" {
		c.Data["json"] = models.ErrorMessage{
			Message:    "No hotels found",
			SubMessage: "Please prodive location and dates properly",
			Code:       500,
		}
	} else if hotelCheckInDate < time.Now().Format("2006-01-02") || hotelCheckOutDate < time.Now().Format("2006-01-02") {
		c.Data["json"] = models.ErrorMessage{
			Message:    "No hotels found",
			SubMessage: "Please prodive valid dates",
			Code:       500,
		}
	} else if hotelCheckInDate >= hotelCheckOutDate {
		c.Data["json"] = models.ErrorMessage{
			Message:    "Checkin date must be before checkout date",
			SubMessage: "Please prodive valid dates",
			Code:       500,
		}
	} else if exist {
		c.Data["json"] = global.Cached.Get(key)
	} else {
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
			c.Data["json"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON." + err.Error(),
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.ServeJSON()
			return
		} else if len(data.Data) == 0 {
			c.Data["json"] = models.ErrorMessage{
				Message:    "No hotels found",
				SubMessage: "Please try other location and dates",
				Code:       400,
			}
			c.ServeJSON()
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
			hotel.CheckinDate = hotelCheckInDate
			hotel.CheckoutDate = hotelCheckOutDate
			hotelData.Hotels = append(hotelData.Hotels, hotel)
		}

		// c.Data["Hotels"] = hotelData.Hotels
		// c.TplName = "hotel.tpl"
		c.Data["json"] = hotelData.Hotels
		global.Cached.Put(key, hotelData.Hotels, 300*time.Second)

	}
	c.ServeJSON()
}

type SearchHotelController struct {
	beego.Controller
}

func (c *SearchHotelController) Get() {
	location := c.GetString("location")
	hotelCheckInDate := c.GetString("hotelCheckInDate")
	hotelCheckOutDate := c.GetString("hotelCheckOutDate")
	key := "HS:" + location + hotelCheckInDate + hotelCheckOutDate
	exist := global.Cached.IsExist(key)

	if location == "" && hotelCheckInDate == "" && hotelCheckOutDate == "" {
		c.Data["json"] = models.ErrorMessage{
			Message:    "No hotels found",
			SubMessage: "Please prodive location and dates properly",
			Code:       500,
		}
	} else if hotelCheckInDate < time.Now().Format("2006-01-02") || hotelCheckOutDate < time.Now().Format("2006-01-02") {
		c.Data["json"] = models.ErrorMessage{
			Message:    "No hotels found",
			SubMessage: "Please prodive valid dates",
			Code:       500,
		}
	} else if hotelCheckInDate >= hotelCheckOutDate {
		c.Data["json"] = models.ErrorMessage{
			Message:    "Checkin date must be before checkout date",
			SubMessage: "Please prodive valid dates",
			Code:       500,
		}
	} else if exist {
		c.Data["json"] = global.Cached.Get(key)
	} else {
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
			c.Data["json"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			// c.TplName = "error.tpl"

		} else {
			c.Data["Json"] = hotelData
			global.Cached.Put(key, hotelData, 300*time.Second)
		}
	}
	c.ServeJSON()
}

func GetHotelDescription(descriptionData models.DescriptionData) {
	url := "https://booking-com13.p.rapidapi.com/stays/properties/detail/description?id_detail=cr%2Fla-buena-vida-cabinas&language_code=en-us"

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("X-RapidAPI-Key", global.XRapidAPIKey)
	req.Header.Add("X-RapidAPI-Host", global.XRapidAPIHost)

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)
	jsonString := string(body)

	descriptionData.JsonChan <- jsonString
}

type HotelPhotosController struct {
	beego.Controller
}

func GetHotelPhotos(hotelPhotoData models.HotelPhotoData) {
	url := "https://booking-com13.p.rapidapi.com/stays/properties/detail/photos?id_detail=%s&language_code=en-us"
	url = fmt.Sprintf(url, hotelPhotoData.IdDetail)
	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("X-RapidAPI-Key", global.XRapidAPIKey)
	req.Header.Add("X-RapidAPI-Host", global.XRapidAPIHost)

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)

	jsonString := string(body)

	hotelPhotoData.JsonChan <- jsonString
}

func GetHotelDetails(hotelDetails models.HotelDetailsData) {

	url := "https://booking-com13.p.rapidapi.com/stays/properties/detail?id_detail=%s&checkin_date=%s&checkout_date=%s&language_code=en-us&currency_code=USD"
	url = fmt.Sprintf(url, hotelDetails.IdDetail, hotelDetails.CheckinDate, hotelDetails.CheckoutDate)
	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("X-RapidAPI-Key", global.XRapidAPIKey)
	req.Header.Add("X-RapidAPI-Host", global.XRapidAPIHost)

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := io.ReadAll(res.Body)
	jsonString := string(body)

	hotelDetails.JsonChan <- jsonString
}

type HotelDetailsController struct {
	beego.Controller
}

func (c *HotelDetailsController) Get() {
	param := c.Ctx.Request.RequestURI
	param = param[15:]
	param, _, _ = strings.Cut(param, "?")
	checkinDate := c.GetString("checkin_date")
	checkoutDate := c.GetString("checkout_date")
	key := "HD:" + param + checkinDate + checkoutDate
	exist := global.Cached.IsExist(key)

	if param == "" || checkinDate == "" || checkoutDate == "" {
		c.Data["Data"] = models.ErrorMessage{
			Message:    "Hotel not found",
			SubMessage: "Please prodive valid id",
			Code:       500,
		}
		c.TplName = "error.tpl"
		return
	} else if checkinDate < time.Now().Format("2006-01-02") || checkoutDate < time.Now().Format("2006-01-02") {
		c.Data["Data"] = models.ErrorMessage{
			Message:    "Checkin date must be before checkout date",
			SubMessage: "Please prodive valid dates",
			Code:       500,
		}
		c.TplName = "error.tpl"
		return
	} else if checkinDate >= checkoutDate {
		c.Data["Data"] = models.ErrorMessage{
			Message:    "Checkin date must be before checkout date",
			SubMessage: "Please prodive valid dates",
			Code:       500,
		}
		c.TplName = "error.tpl"
		return
	} else if exist {
		c.Data["Data"] = global.Cached.Get(key)
		c.TplName = "hotel-detail.tpl"
		return
	} else {
		description := models.Description{}
		descriptionChan := make(chan string)
		descriptionData := models.DescriptionData{}
		descriptionData.IdDetail = param
		descriptionData.JsonChan = descriptionChan

		go GetHotelDescription(descriptionData)
		jsonString := <-descriptionChan

		err := json.Unmarshal([]byte(jsonString), &description)
		if err != nil {
			c.Data["Data"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.TplName = "error.tpl"
			return
		}

		hotelDetailsResponse := models.HotelDetailsResponse{}
		hotelDetailsData := models.HotelDetailsData{}
		jsonChan := make(chan string)
		hotelDetailsData.JsonChan = jsonChan
		hotelDetailsData.Error = nil
		hotelDetailsData.IdDetail = param
		hotelDetailsData.CheckinDate = checkinDate
		hotelDetailsData.CheckoutDate = checkoutDate
		if len(description.Data) > 0 {
			hotelDetailsData.Description = description.Data[0].Description
		}

		go GetHotelDetails(hotelDetailsData)
		jsonString = <-jsonChan

		err = json.Unmarshal([]byte(jsonString), &hotelDetailsResponse)
		if err != nil {
			c.Data["Data"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.TplName = "error.tpl"
			return
		}

		if len(hotelDetailsResponse.Data.BasicPropertyData) > 0 {
			hotelDetailsData.Id = hotelDetailsResponse.Data.BasicPropertyData[0].ID
			hotelDetailsData.Name = hotelDetailsResponse.Data.BasicPropertyData[0].Name
		}
		hotelDetailsData.Photos = []string{}
		hotelDetailsData.Reviews = []models.Review{}
		for _, v := range hotelDetailsResponse.Data.FeaturedReview {
			review := models.Review{}
			review.GuestName = v.GuestName
			review.NegativeText = v.NegativeText
			review.PositiveText = v.PositiveText
			review.Title = v.Title
			review.UserAvatarURL = v.UserAvatarURL
			hotelDetailsData.Reviews = append(hotelDetailsData.Reviews, review)
		}

		hotelPhotosData := models.HotelPhotoData{}
		hotelPhotosData.IdDetail = param
		hotelPhotosData.JsonChan = jsonChan

		go GetHotelPhotos(hotelPhotosData)
		jsonString = <-hotelPhotosData.JsonChan

		hotelPhotos := models.HotelPhotos{}
		err = json.Unmarshal([]byte(jsonString), &hotelPhotos)
		if err != nil {
			c.Data["Data"] = models.ErrorMessage{
				Message:    "Error unmarshaling JSON",
				SubMessage: "Please try again later",
				Code:       500,
			}
			c.TplName = "error.tpl"
			return
		}

		for _, v := range hotelPhotos.Data.Photos {
			hotelDetailsData.Photos = append(hotelDetailsData.Photos, "https://cf.bstatic.com"+v.PhotoUri)
		}

		c.Data["Data"] = hotelDetailsData
		global.Cached.Put(key, hotelDetailsData, 300*time.Second)
		c.TplName = "hotel-detail.tpl"
	}
}
