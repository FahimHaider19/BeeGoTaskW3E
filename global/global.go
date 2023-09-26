package global

import (
	"github.com/beego/beego/cache"
	beego "github.com/beego/beego/v2/server/web"
)

var Cached cache.Cache
var XRapidAPIHost, _ = beego.AppConfig.String("XRapidAPIHost")
var XRapidAPIKey, _ = beego.AppConfig.String("XRapidAPIKey")
