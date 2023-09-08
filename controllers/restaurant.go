package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type RestaurantController struct {
	beego.Controller
}

func (c *RestaurantController) Get() {
	c.TplName = "restaurant.tpl"
}
