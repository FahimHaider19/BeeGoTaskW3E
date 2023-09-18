package main

import (
	_ "BeeGoTaskW3E/routers"
	"BeeGoTaskW3E/utils"

	beego "github.com/beego/beego/v2/server/web"
)

func main() {
	beego.AddFuncMap("until", utils.Until)
	beego.AddFuncMap("getarr", utils.GetArrayElement)
	beego.Run()
}
