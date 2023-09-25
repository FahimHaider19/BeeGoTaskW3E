package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

func init() { // 2

}

func (c *MainController) Get() {
	c.TplName = "index.tpl"
}
