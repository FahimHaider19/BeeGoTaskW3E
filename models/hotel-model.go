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
	Reviews    Reviews    `json:"reviews"`
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
	IdDetail                   string                     `json:"idDetail"`
}

type HotelStruct struct {
	CurrentPage int    `json:"currentPage"`
	Data        []Item `json:"data"`
}

type Hotel struct {
	Id                    int
	IdDetail              string
	Name                  string
	Rating                int
	Reviews               int
	Location              string
	City                  string
	Photos                string
	Price                 string
	Currency              string
	FreeCancellationUntil string
	Bed                   int
	Kitchen               int
	Livingroom            int
	Pool                  int
	NonStarRating         int
	CheckinDate           string
	CheckoutDate          string
}

type HotelData struct {
	Location  string
	StartDate string
	EndDate   string
	Hotels    []Hotel
	JsonChan  chan string
	ErrorChan chan error
}

// Hotel Details
type Property struct {
	ID       int `json:"id"`
	Location struct {
		City string `json:"city"`
	} `json:"location"`
	Name string `json:"name"`
}

type Review struct {
	GuestName     string `json:"guestName"`
	NegativeText  string `json:"negativeText"`
	PositiveText  string `json:"positiveText"`
	Title         string `json:"title"`
	UserAvatarURL string `json:"userAvatarUrl"`
}

type RTRoomPhoto struct {
	PhotoUrl string `json:"photoUri"`
}

type Data struct {
	BasicPropertyData []Property    `json:"BasicPropertyData"`
	FeaturedReview    []Review      `json:"FeaturedReview"`
	RTRoomPhotos      []RTRoomPhoto `json:"RTRoomPhoto"`
}

type HotelDetailsResponse struct {
	Data Data `json:"data"`
}

type HotelDetailsData struct {
	Id           int
	CheckinDate  string
	CheckoutDate string
	IdDetail     string
	Name         string
	Description  string
	Facilities   []string
	Photos       []string
	Price        string
	Reviews      []Review
	Error        error
	JsonChan     chan string
}

type Description struct {
	Data []struct {
		Description string `json:"description"`
	} `json:"data"`
}

type DescriptionData struct {
	IdDetail string
	JsonChan chan string
	Error    error
}

type HotelPhotos struct {
	Data struct {
		Photos []struct {
			PhotoUri string `json:"photoUri"`
		} `json:"photos"`
	} `json:"data"`
}

type HotelPhotoData struct {
	IdDetail string
	JsonChan chan string
	Error    error
}
