const axios = require('axios');

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
    if(!document.getElementById('flightui').classList.contains('hidden'))
        document.getElementById('flightui').classList.add('hidden')
}


function loadFlightUi() {
    document.getElementById('flightui').classList.remove('hidden')
    if(!document.getElementById('hotelui').classList.contains('hidden'))
        document.getElementById('hotelui').classList.add('hidden')
}

function getHotels() {
    
}

function handleReturnDateInputField() {
    if(document.getElementById('itineraryType').value == 'ROUND_TRIP') {
        document.getElementById('return_date_div').classList.remove('hidden')
        document.getElementById('departure_date_div').classList.remove('col-span-2')}
    if(document.getElementById('itineraryType').value == 'ONE_WAY') {
        document.getElementById('return_date_div').classList.add('hidden')
        document.getElementById('return_date').value = ''
        document.getElementById('departure_date_div').classList.add('col-span-2')
    }
}