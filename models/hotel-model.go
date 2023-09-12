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
	TotalScore   int `json:"totalScore"`
}

type AlternativeExternalReviews struct {
	ReviewsCount int `json:"reviewsCount"`
	TotalScore   int `json:"totalScore"`
}

type BasicPropertyData struct {
	AlternativeExternalReviews AlternativeExternalReviews `json:"alternativeExternalReviews"`
	ID                         int                        `json:"id"`
	Location                   Location                   `json:"location"`
	Photos                     Photo                      `json:"photos"`
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

type Item struct {
	BasicPropertyData          BasicPropertyData          `json:"basicPropertyData"`
	Blocks                     []Block                    `json:"blocks"`
	MatchingUnitConfigurations MatchingUnitConfigurations `json:"matchingUnitConfigurations"`
}

type HotelStruct struct {
	CurrentPage int    `json:"currentPage"`
	Data        []Item `json:"data"`
}

type Hotel struct {
	Id                    int
	Rating                float32
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
}

type HotelData struct {
	Location  string
	StartDate string
	EndDate   string
	Hotels    []Hotel
	JsonChan  chan string
	ErrorChan chan error
}
