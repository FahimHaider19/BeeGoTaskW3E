package main

import (
	_ "BeeGoTaskW3E/routers"
	beego "github.com/beego/beego/v2/server/web"
	"BeeGoTaskW3E/db"
)

func main() {
	db.Connect()
	beego.Run()
}

