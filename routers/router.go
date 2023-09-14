package routers

import (
	"BeeGoTaskW3E/controllers"

	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/restaurant", &controllers.RestaurantController{})
	beego.Router("/hotel/details/:ln/:id", &controllers.HotelDetailsController{})
	beego.Router("/hotel", &controllers.HotelController{})
	beego.Router("/search/hotel", &controllers.SearchHotelController{})
	beego.Router("/flight", &controllers.FlightController{})
	beego.Router("/search/flight", &controllers.SearchFlightController{})
}
