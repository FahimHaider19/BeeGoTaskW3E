package models

type HighResJpegUrl struct {
	RelativeUrl string `json:"relativeUrl"`
}

type Photo struct {
	Main Main `json:"main"`
}

type Main struct {
	HighResJpegUrl HighResJpegUrl `json:"highResJpegUrl"`
}

type Location struct {
	Address string `json:"address"`
	City    string `json:"city"`
}

type Reviews struct {
	ReviewsCount int `json:"reviewsCount"`
}

type StarRating struct {
	Value int `json:"value"`
}

type BasicPropertyData struct {
	Reviews    Reviews    `json:"Reviews"`
	ID         int        `json:"id"`
	Location   Location   `json:"location"`
	Photos     Photo      `json:"photos"`
	StarRating StarRating `json:"starRating"`
}

type FinalPrice struct {
	Amount   float64 `json:"amount"`
	Currency string  `json:"currency"`
}

type Block struct {
	FinalPrice            FinalPrice `json:"finalPrice"`
	FreeCancellationUntil string     `json:"freeCancellationUntil"`
}

type CommonConfiguration struct {
	NbBedrooms    int `json:"nbBedrooms"`
	NbKitchens    int `json:"nbKitchens"`
	NbLivingrooms int `json:"nbLivingrooms"`
	NbPools       int `json:"nbPools"`
}

type MatchingUnitConfigurations struct {
	CommonConfiguration CommonConfiguration `json:"commonConfiguration"`
}

type DisplayName struct {
	Text string `json:"text"`
}

type Item struct {
	BasicPropertyData          BasicPropertyData          `json:"basicPropertyData"`
	Blocks                     []Block                    `json:"blocks"`
	MatchingUnitConfigurations MatchingUnitConfigurations `json:"matchingUnitConfigurations"`
	DisplayName                DisplayName                `json:"displayName"`
}

type HotelStruct struct {
	CurrentPage int    `json:"currentPage"`
	Data        []Item `json:"data"`
}

type Hotel struct {
	Id                    int
	Name                  string
	Rating                int
	Reviews               int
	Location              string
	City                  string
	Photo                 string
	Price                 float64
	Currency              string
	FreeCancellationUntil string
	Bed                   int
	Kitchen               int
	Livingroom            int
	Pool                  int
	NonStarRating         int
}

type HotelData struct {
	Location  string
	StartDate string
	EndDate   string
	Hotels    []Hotel
	JsonChan  chan string
	ErrorChan chan error
}
