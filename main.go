package main

import (
	"BeeGoTaskW3E/global"
	_ "BeeGoTaskW3E/routers"
	"BeeGoTaskW3E/utils"

	"github.com/beego/beego/cache"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	global.Cached, _ = cache.NewCache("memory", `{
		"interval":300000000,
		"EmbedExpiry":3600000
	}`)
}

func main() {
	beego.AddFuncMap("until", utils.Until)
	beego.AddFuncMap("getarr", utils.GetArrayElement)
	beego.Run()
}
