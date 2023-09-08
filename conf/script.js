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
    if(!document.getElementById('restaurantui').classList.contains('hidden'))
        document.getElementById('restaurantui').classList.add('hidden')
    if(!document.getElementById('flightui').classList.contains('hidden'))
        document.getElementById('flightui').classList.add('hidden')
}

function loadRestaurantUi() {
    document.getElementById('restaurantui').classList.remove('hidden')
    if(!document.getElementById('hotelui').classList.contains('hidden'))
        document.getElementById('hotelui').classList.add('hidden')
    if(!document.getElementById('flightui').classList.contains('hidden'))
        document.getElementById('flightui').classList.add('hidden')
}

function loadFlightUi() {
    document.getElementById('flightui').classList.remove('hidden')
    if(!document.getElementById('hotelui').classList.contains('hidden'))
        document.getElementById('hotelui').classList.add('hidden')
    if(!document.getElementById('restaurantui').classList.contains('hidden'))
        document.getElementById('restaurantui').classList.add('hidden')
}