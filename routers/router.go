package routers

import (
	"BeeGoTaskW3E/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
    beego.Router("/", &controllers.MainController{})
	beego.Router("/register", &controllers.RegisterController{})
	beego.Router("/login", &controllers.LoginController{})
	beego.Router("/restaurant", &controllers.RestaurantController{})
	beego.Router("/hotel", &controllers.HotelController{})
	beego.Router("/hotel/:id", &controllers.HotelController{})
	beego.Router("/flight", &controllers.FlightController{})
}
