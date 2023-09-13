package main

import (
	_ "BeeGoTaskW3E/routers"

	beego "github.com/beego/beego/v2/server/web"
)

func main() {
	beego.Run()
}
