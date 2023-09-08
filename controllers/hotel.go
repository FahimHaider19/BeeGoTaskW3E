package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type HotelController struct {
	beego.Controller
}

func (c *HotelController) Get() {
	id := c.Ctx.Input.Param(":id")
	location := c.GetString("location")
	hotelCheckInDate := c.GetString("hotelCheckInDate")
	hotelCheckOutDate := c.GetString("hotelCheckOutDate")
	if id == "" {
		c.TplName = "hotel.tpl"
	} else if location!="" && hotelCheckInDate!="" && hotelCheckOutDate!="" {
		c.TplName = "hotel-detail.tpl"
	}


	
}
