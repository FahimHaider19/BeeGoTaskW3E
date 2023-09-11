package models

import (
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Name     string
	Email    string `gorm:"unique;not null"`
	Password string `gorm:"not null"`
}

type Price struct {
	Currency struct {
		Code string `json:"code"`
	} `json:"currency"`
	Value float64 `json:"value"`
}

type SellPriceBaggage struct {
	MaxWeight     int    `json:"maxWeight"`
	NumberOfUnits int    `json:"numberOfUnits"`
	WeightUnit    string `json:"weightUnit"`
}

type SellSpecification struct {
	SellPriceBaggage []SellPriceBaggage `json:"sellPriceBaggage"`
}

type TravelerPrice struct {
	Price struct {
		Price Price `json:"price"`
		VAT   struct {
			Value float64 `json:"value"`
		} `json:"vat"`
	} `json:"price"`
}

type Flight struct {
	AvailableExtraProducts []struct {
		SellSpecification SellSpecification `json:"sellSpecification"`
	} `json:"availableExtraProducts"`
	ID             string          `json:"id"`
	ShareableURL   string          `json:"shareableUrl"`
	TravelerPrices []TravelerPrice `json:"travelerPricesWithoutPaymentDiscounts"`
	Type           string          `json:"type"`
}

type Data struct {
	CurrentPage int `json:"currentPage"`
	Data        struct {
		Flights []Flight `json:"flights"`
	} `json:"data"`
}
