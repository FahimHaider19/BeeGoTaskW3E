package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type FlightController struct {
	beego.Controller
}

func (c *FlightController) Get() {
	c.TplName = "flight.tpl"
}
