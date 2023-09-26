var guest = 0

function showGuestsMenu() {
    if(document.getElementById('menu-guests').classList.contains('invisible'))
        document.getElementById('menu-guests').classList.remove('invisible')
    else
        document.getElementById('menu-guests').classList.add('invisible')
}

function Menu2() {
    if(document.getElementById('menu2').classList.contains('hidden'))
        document.getElementById('menu2').classList.remove('hidden')
    else
        document.getElementById('menu2').classList.add('hidden')
}

function ApplyGuest() {
    document.getElementById('guestsInput').value = guest
    document.getElementById('numOfGuests').value = guest
    document.getElementById('menu-guests').classList.add('invisible')
}

function addGuest() {
    guest += 1
    document.getElementById('numOfGuests').innerHTML = guest
}

function reduceGuest() {
    if(guest>=1) guest -= 1
    document.getElementById('numOfGuests').innerHTML = guest
}

function loadHotelUi() {
    document.getElementById('hotelui').classList.remove('hidden')
    document.getElementById('hotel-div').classList.remove('hidden')
    if(!document.getElementById('flightui').classList.contains('hidden'))
        document.getElementById('flightui').classList.add('hidden')
    if(!document.getElementById('flight-div').classList.contains('hidden'))
        document.getElementById('flight-div').classList.add('hidden')
}


function loadFlightUi() {
    document.getElementById('flightui').classList.remove('hidden')
    document.getElementById('flight-div').classList.remove('hidden')
    if(!document.getElementById('hotelui').classList.contains('hidden'))
        document.getElementById('hotelui').classList.add('hidden')
    if(!document.getElementById('hotel-div').classList.contains('hidden'))
        document.getElementById('hotel-div').classList.add('hidden')
}

function handleReturnDateInputField() {
    if(document.getElementById('itineraryType').value == 'return') {
        document.getElementById('return_date_div').classList.remove('hidden')
        document.getElementById('departure_date_div').classList.remove('col-span-2')}
    if(document.getElementById('itineraryType').value == 'one_way') {
        document.getElementById('return_date_div').classList.add('hidden')
        document.getElementById('return_date').value = ''
        document.getElementById('departure_date_div').classList.add('col-span-2')
    }
}

async function searchHotel() {
    var location = document.getElementById('location').value
    var checkInDate = document.getElementById('hotelCheckInDate').value
    var checkOutDate = document.getElementById('hotelCheckOutDate').value
    var hotels = []

    if(location == '' || checkInDate == '' || checkOutDate == '') {
        alert('Please fill all the fields')
        return
    }
    else if(checkInDate >= checkOutDate) {
        alert('Check-in date must be before check-out date')
        return
    }
    else if(checkInDate < new Date().toISOString().slice(0, 10)) {
        alert('Checkin date must be after today')
        return
    }

    var temp = `<div class="grid place-items-center mt-12">
    <div class="max-w-7xl z-0">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 place-items-center grid-flow-row auto-rows-max py-6">`
    
    for(let i=0; i<6; i++) temp+= `
    <!-- placeholder card -->
            <div class="p-2 bg-gray-100 w-full h-full animate-pulse">
                <div class="bg-white max-w-md h-full">
                    <div class="relative p-2">
                        <img class="border-8 border-white h-64 w-full object-cover bg-gray-200">
                    </div>
                    <div class="px-4 pb-4">
                        <div class="text-xl font-bold py-2 bg-gray-200 h-10 rounded-lg"></div>
                        <div class="flex justify-between mt-4">
                            <div class="">
                                <div class="flex h-4 gap-1">
                                    <div class="h-4 w-4 rounded-full bg-gray-200"></div>
                                    <div class="h-4 w-4 rounded-full bg-gray-200"></div>
                                    <div class="h-4 w-4 rounded-full bg-gray-200"></div>
                                    <div class="h-4 w-4 rounded-full bg-gray-200"></div>
                                    <div class="h-4 w-16 rounded-full bg-gray-200"></div>
                                </div>
                                <div class="h-4 w-28 bg-gray-200 my-2 rounded-lg"></div>
                                <div class="flex gap-1 text-gray-200 mt-3">
                                    <div class="h-4 w-20 rounded-lg bg-gray-200"></div>
                                    <div>&gt;</div>
                                    <div class="h-4 w-28 rounded-lg bg-gray-200"></div>
                                </div>
                            </div>
                            <button class="flex whitespace-nowrap h-12 w-32 p-3 rounded-md text-white font-semibold bg-gray-200"></button>
                        </div>
                        <div class="flex justify-between">
                            <div class="flex gap-2">
                                <div class="flex gap-1">
                                    <div class="h-4 w-24 rounded-lg bg-gray-200"></div>
                                </div>
                                <div class="flex gap-1">
                                    <div class="h-4 w-32 rounded-lg bg-gray-200"></div>
                                </div>
                            </div>
                            <div><div class="h-4 w-20 rounded-lg bg-gray-200"></div></div>
                        </div>
                    </div>
                </div>
            </div>`
    temp+=`</div></div></div>`

    document.getElementById('hotel-div').innerHTML = temp
    console.log(location, checkInDate, checkOutDate)

    const url = `/hotel?location=${location}&hotelCheckInDate=${checkInDate}&hotelCheckOutDate=${checkOutDate}&language_code=en-us&currency_code=USD`;
    try {
        const response = await fetch(url);
        const result = await response.text();
        console.log(result)
        hotels = JSON.parse(result);
        console.log(hotels);
        if (hotels.hasOwnProperty('Message')) {
            console.log(hotels.Message)
            alert(hotels.Message + ". " + hotels.SubMessage)
            document.getElementById('hotel-div').innerHTML = ''
            return
        }
    } catch (error) {
        document.getElementById('hotel-div').innerHTML = ''
        console.error(error);
    }
        
    try {
        var html = `<div class="grid place-items-center mt-12">
        <div class="max-w-7xl z-0">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 place-items-center grid-flow-row auto-rows-max py-6">`
        
        for(let hotel of hotels) {
            html+= `
                    <!-- card -->
                    <div class="max-w-xs h-full rounded overflow-hidden shadow-lg"> 
                        <div class="w-full relative">
                            <img class="w-full h-80" src=${hotel.Photo} alt="Sunset in the mountains"/>
                            <div class="absolute py-1 px-2 bg-white bg-opacity-50 bottom-2 left-2 rounded-md">
                                <span class="font-bold">${hotel.Price}$</span>
                                <span class="text-sm">per night</span>
                            </div>
                        </div>
                        
                        <div class="p-4 flex flex-col justify-between">
                            <div class="flex font-bold text-xs text-gray-700">`
                                if (hotel.Bed) html+=
                                `<div class="font-bold text-xs mb-2 text-gray-700">${hotel.Bed} Bedroom .</div>`
                                if(hotel.Livingroom) html+=
                                `<div class="font-bold text-xs mb-2 text-gray-700">${hotel.Livingroom} Livingroom .</div>`
                                if(hotel.Kitchen) html+=
                                `<div class="font-bold text-xs mb-2 text-gray-700">${hotel.Kitchen} Kitchen .</div>`
                    html+= `</div><div class="font-bold text-xl mb-2">${hotel.Name}</div>
                            <div class="flex items-center py-1">
                                <span class="font-bold pr-1 text-green-600">${hotel.Rating}</span>`
                
                                for(let i=0; i<hotel.Rating; i++) html+= 
                                `<svg id="full-star${i}" class="fill-current text-green-600" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg>`
                                for(let i=0; i<5-hotel.Rating; i++) html+= 
                                `<svg id="blank-star${i}" class="fill-current text-green-600" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><path d="M287.9 0c9.2 0 17.6 5.2 21.6 13.5l68.6 141.3 153.2 22.6c9 1.3 16.5 7.6 19.3 16.3s.5 18.1-5.9 24.5L433.6 328.4l26.2 155.6c1.5 9-2.2 18.1-9.6 23.5s-17.3 6-25.3 1.7l-137-73.2L151 509.1c-8.1 4.3-17.9 3.7-25.3-1.7s-11.2-14.5-9.7-23.5l26.2-155.6L31.1 218.2c-6.5-6.4-8.7-15.9-5.9-24.5s10.3-14.9 19.3-16.3l153.2-22.6L266.3 13.5C270.4 5.2 278.7 0 287.9 0zm0 79L235.4 187.2c-3.5 7.1-10.2 12.1-18.1 13.3L99 217.9 184.9 303c5.5 5.5 8.1 13.3 6.8 21L171.4 443.7l105.2-56.2c7.1-3.8 15.6-3.8 22.6 0l105.2 56.2L384.2 324.1c-1.3-7.7 1.2-15.5 6.8-21l85.9-85.1L358.6 200.5c-7.8-1.2-14.6-6.1-18.1-13.3L287.9 79z"/></svg>`
                        html+=  `<span class="text-sm px-2 text-gray-600">${hotel.Reviews} reviews</span>
                            </div>
                            <div class="flex items-start py-2">
                                <svg class="fill-current text-gray-500" xmlns="http://www.w3.org/2000/svg" height="1.15em" viewBox="0 0 384 512"><style>svg{fill:#5e5c64}</style><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg> 
                                <span class="text-gray-700 text-xs px-2 truncate">${hotel.Location}, ${hotel.City}</span>
                            </div>
                            <a href="/hotel/details/${hotel.IdDetail}?checkin_date=${hotel.CheckinDate}&checkout_date=${hotel.CheckoutDate}" class="flex justify-center py-2">
                                <button class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">View Details</button>
                            </a>
                        </div>
                    </div>`
        }
        html+=`</div>
            </div>
            </div>`
        
        document.getElementById('hotel-div').innerHTML = html
      } catch (error) {
          document.getElementById('hotel-div').innerHTML = ''
          console.error(error);
      }
}

async function searchFlight(){ 
    let type = document.getElementById('itineraryType').value
    console.log(type)
    let from = document.getElementById('location_from').value
    let to = document.getElementById('location_to').value
    let departure_date = document.getElementById('departure_date').value
    let return_date = document.getElementById('return_date').value
    let url = ""
    let flights = []

    if(from == '' || to == '' || departure_date == '') {
        alert('Please fill all the fields')
        return
    }
    else if(type == 'return' && return_date == '') {
        alert('Please fill all the fields')
        return
    }
    else if(location_from == location_to) {
        alert('Departure and arrival locations must be different')
        return
    }
    else if(type == 'one_way' && departure_date < new Date().toISOString().slice(0, 10)) {
        alert('Departure date must be after today')
        return
    }
    else if(type == 'return' &&departure_date >= return_date) {
        alert('Departure date must be before return date')
        return
    }

    if(type == 'one_way') 
        url = `/flight?type=one-way&location_from=${from}&location_to=${to}&departure_date=${departure_date}&page=1&country_flag=us`
    else if(type == 'return')
        url = `/flight?type=return&location_from=${from}&location_to=${to}&departure_date=${departure_date}&return_date=${return_date}&page=1&country_flag=us`

    try {
        let html =
        `<div class="grid grid-cols-1 gap-4 place-items-center">
            <h3 class="bg-gray-300 rounded-lg h-8 w-1/2 mt-5 mx-5"></h3>
            <div class="grid place-items-center gap-6 pb-6 px-3 sm:px-5 w-full">`
                for(let i=0; i<5; i++) html +=`
                <div class="bg-gray-100 shadow sm:rounded-lg px-4 sm:px-6 max-w-7xl animate-pulse mx-4 w-full">
                    <div class=" pt-5 sm:pt-6">
                        <div class="flex justify-between">
                            <h3 class="bg-gray-300 rounded-lg h-6 w-1/3"></h3>
                            <h3 class="bg-gray-300 rounded-lg h-6 w-1/6"></h3>
                        </div>
                    </div>
                    <div class="my-6">
                        <div class="rounded-md bg-blue-50 px-6 py-5 sm:flex sm:items-center sm:justify-between">
                            <div class="mt-3 sm:mt-0 sm:ml-4 w-full">
                                <div class="bg-blue-200 rounded-lg h-6 w-1/3 my-1"></div>
                                <div class="bg-gray-300 rounded-lg h-6 w-2/3 my-1"></div>
                            </div>
                            <a class="mt-4 sm:mt-0 sm:ml-6 sm:flex-shrink-0" href="{{.Url}}">
                                <button type="button" class="bg-gray-400 rounded-lg h-12 w-32"></button>
                            </a>
                        </div>
                    </div>
                </div>`
                html +=`
            </div>      
        </div>`
        document.getElementById('flight-div').innerHTML = html
        console.log(url)
        const response = await fetch(url);
        const result = await response.text();
        console.log(result);
        flights = JSON.parse(result);
        if (flights.hasOwnProperty('Message')) {
            console.log(flights.Message)
            alert(flights.Message + ". " + flights.SubMessage)
            document.getElementById('flight-div').innerHTML = ''
            return
        }
    } catch (error) {
        document.getElementById('flight-div').innerHTML = ''
        console.error(error);
    }

    try {
        let html = 
        `<div class="grid grid-cols-1 gap-6 place-items-center">`
        for(let flight of flights) {
            html+= `
            <div class="bg-gray-50 shadow sm:rounded-lg px-4 sm:px-6 max-w-7xl w-full">
                <div class=" pt-5 sm:pt-6">
                    <div class="flex justify-between">
                        <h3 class="text-lg font-medium leading-6 text-gray-900">${from} -> ${to} </h3>
                        <h3 class="text-md font-medium leading-6 text-gray-900">${departure_date} </h3>
                    </div>
                </div>
                <div class="my-6">
                    <div class="rounded-md bg-blue-50 px-6 py-5 sm:flex sm:items-start sm:justify-between">
                        <div class="mt-3 sm:mt-0 sm:ml-4">
                            <div class="text-sm font-medium text-blue-600">Flight-${flight.Id}</div>
                            <div class="mt-1 text-sm text-gray-600 sm:flex sm:items-center">
                                <div>Price: ${flight.Price} + <span class="text-sm text-gray-500">${flight.Vat}</span> ${flight.Currency}</div>`
                                if(flight.MaxWeight) html+=`
                                <span class="hidden sm:mx-2 sm:inline" aria-hidden="true">&middot;</span>
                                <div class="mt-1 sm:mt-0">Max Weight: ${flight.MaxWeight}</div>`
                                if(flight.NumberOfUnits) html+=`
                                <span class="hidden sm:mx-2 sm:inline" aria-hidden="true">&middot;</span>
                                <div class="mt-1 sm:mt-0">Baggage limit: ${flight.NumberOfUnits}</div>`
                    html+= `</div>
                        </div>
                        <a class="mt-4 sm:mt-0 sm:ml-6 sm:flex-shrink-0" href="${flight.Url}">
                            <button type="button" class="inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 font-medium shadow-sm text-indigo-700 hover:bg-indigo-200 focus:outline-none sm:text-sm">Book Ticket</button>
                        </a>
                    </div>
                    
                </div>
            </div> `
        }
        html+=
        `</div>`

        document.getElementById('flight-div').innerHTML = html

    } catch (error) {
        document.getElementById('flight-div').innerHTML = ''
        console.error(error);
    }
}