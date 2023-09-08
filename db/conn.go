package db

import (
	"fmt"
	"gorm.io/gorm"
	"gorm.io/driver/postgres"
)

var DB *gorm.DB

func Connect() {
	dsn := "host=localhost user=user-name password=strong-password dbname=beegodb port=5432 sslmode=disable TimeZone=Asia/Shanghai"
	conn, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})
	if err != nil {
		panic(err)
	}
	DB = conn
	fmt.Println("Connection Opened to Database")
}