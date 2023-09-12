package models

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

type FlightStruct struct {
	CurrentPage  int `json:"currentPage"`
	FlightStruct struct {
		Flights []Flight `json:"flights"`
	} `json:"data"`
}

type FlightInfo struct {
	Id            string
	Url           string
	Price         float64
	Vat           float64
	Currency      string
	MaxWeight     int
	NumberOfUnits int
}

type FlightData struct {
	Origin      string
	Destination string
	Departure   string
	Return      string
	Flights     []FlightInfo
	JsonChan    chan string
	ErrorChan   chan error
}

type ErrorMessage struct {
	Message    string
	SubMessage string
	Code       int
}
