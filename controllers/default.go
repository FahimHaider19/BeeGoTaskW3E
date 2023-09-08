package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.TplName = "index.tpl"
}

type RegisterController struct {
	beego.Controller
}

func (c *RegisterController) Get() {
	c.TplName = "register.tpl"
}

func (c *RegisterController) Post() {
	email := c.GetString("email")
	pass := c.GetString("password")
	print(email, pass)
	c.Redirect("/register", 302)
}

type LoginController struct {
	beego.Controller
}

func (c *LoginController) Get() {
	c.TplName = "login.tpl"
}

func (c *LoginController) Post() {
	email := c.GetString("email")
	pass := c.GetString("password")
	print(email, pass)
	c.Redirect("/register", 302)
}
