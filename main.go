package main

import (
	_ "BeeGoTaskW3E/routers"
	"BeeGoTaskW3E/utils"

	beego "github.com/beego/beego/v2/server/web"
)

func a() string {
	return "a"
}

func main() {
	beego.AddFuncMap("until", utils.Until)
	beego.Run()
}
