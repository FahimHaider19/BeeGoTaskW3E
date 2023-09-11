<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="../static/js/script.js"></script>
	<title>Document</title>
</head>

<body>
	<div class="flex flex-col items-center">
		<div class="-mb-5 rounded-md bg-gray-300 shadow-md w-full max-w-lg  z-50">
			<div class="sm:hidden">
			  <label for="tabs" class="sr-only">Select a tab</label>
			  <!-- Use an "onChange" listener to redirect the user to the selected tab URL. -->
			  <select id="tabs" name="tabs" class="block w-full rounded-md border-gray-300 focus:border-indigo-500 focus:ring-indigo-500">
				<option selected>Hotels & Homes</option>
				<option>Private Stays</option>
				<option>Log Stays</option>
			  </select>
			</div>
			<div class="hidden sm:block">
			  <nav class="isolate flex divide-x divide-gray-200 rounded-lg shadow" aria-label="Tabs">
				<!-- Current: "text-gray-900", Default: "text-gray-500 hover:text-gray-700" -->
				<button type="button" onclick="loadHotelUi()" class="text-gray-900 rounded-l-lg group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-4 text-sm font-medium text-center hover:bg-gray-50 focus:z-10" aria-current="page">
				  <span>Hotels</span>
				</buton>

				<button type="button" onclick="loadRestaurantUi()" class="text-gray-500 hover:text-gray-700 group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-4 text-sm font-medium text-center hover:bg-gray-50 focus:z-10">
				  <span>Restaurants</span>
				  <span aria-hidden="true" class="bg-transparent absolute inset-x-0 bottom-0 h-0.5"></span>
				</button>
				<button type="button" onclick="loadFlightUi()"  class="text-gray-500 hover:text-gray-700 group relative min-w-0 flex-1 overflow-hidden bg-white py-4 px-4 text-sm font-medium text-center hover:bg-gray-50 focus:z-10">
				  <span>Flights</span>
				  <span aria-hidden="true" class="bg-transparent absolute inset-x-0 bottom-0 h-0.5"></span>
				</button>
			  </nav>
			</div>
		</div>

		<form id="hotelui" class="relative bg-white grid grid-cols-2 px-2 py-10 shadow sm:rounded-lg max-w-4xl w-full">
			<div class="my-2 col-span-2">
				<div class="relative mt-1 rounded-md shadow-sm">
					<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
						<svg xmlns="http://www.w3.org/2000/svg" height="1.3em" viewBox="0 0 384 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#5e5c64}</style><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg>
					</div>
				<input type="text" name="hotel" id="hotel" class="block w-full bg-gray-100 rounded-md border-gray-300 pl-10 py-5 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="location">
				</div>
			</div>

			<div class="my-2 mx-2">
				<div class="flex rounded-md shadow-sm">
					<div class="relative flex flex-grow items-stretch focus-within:z-10">
						<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
							<svg class="h-5 w-5 text-gray-400 bg-gray-100" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
								<style>svg{fill:#5e5c64}</style>
								<path  d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/>
							</svg>
						</div>
						<input type="date" name="checkInDate" id="checkInDate" class="block w-full py-5  bg-gray-100 rounded-none rounded-l-md border-gray-300 pl-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="John Smith">
					</div>
					<div class="relative flex flex-grow items-stretch focus-within:z-10">
						<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
							<svg class="h-5 w-5 text-gray-400 bg-gray-100" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
								<style>svg{fill:#5e5c64}</style>
								<path  d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/>
							</svg>
						</div>
						<input type="date" name="checkOutDate" id="checkOutDate" class="block w-full py-5  bg-gray-100 rounded-none rounded-r-md border-gray-300 pl-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="John Smith">
					</div>
				</div>
			</div>

			<div class="bg-gray-100 my-2">
				<label for="country" class="sr-only">Country</label>
				<div class="relative mt-1 rounded-md shadow-sm">
					<div  onclick="showGuestsMenu()">
						<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
							<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#5e5c64}</style><path d="M72 88a56 56 0 1 1 112 0A56 56 0 1 1 72 88zM64 245.7C54 256.9 48 271.8 48 288s6 31.1 16 42.3V245.7zm144.4-49.3C178.7 222.7 160 261.2 160 304c0 34.3 12 65.8 32 90.5V416c0 17.7-14.3 32-32 32H96c-17.7 0-32-14.3-32-32V389.2C26.2 371.2 0 332.7 0 288c0-61.9 50.1-112 112-112h32c24 0 46.2 7.5 64.4 20.3zM448 416V394.5c20-24.7 32-56.2 32-90.5c0-42.8-18.7-81.3-48.4-107.7C449.8 183.5 472 176 496 176h32c61.9 0 112 50.1 112 112c0 44.7-26.2 83.2-64 101.2V416c0 17.7-14.3 32-32 32H480c-17.7 0-32-14.3-32-32zm8-328a56 56 0 1 1 112 0A56 56 0 1 1 456 88zM576 245.7v84.7c10-11.3 16-26.1 16-42.3s-6-31.1-16-42.3zM320 32a64 64 0 1 1 0 128 64 64 0 1 1 0-128zM240 304c0 16.2 6 31 16 42.3V261.7c-10 11.3-16 26.1-16 42.3zm144-42.3v84.7c10-11.3 16-26.1 16-42.3s-6-31.1-16-42.3zM448 304c0 44.7-26.2 83.2-64 101.2V448c0 17.7-14.3 32-32 32H288c-17.7 0-32-14.3-32-32V405.2c-37.8-18-64-56.5-64-101.2c0-61.9 50.1-112 112-112h32c61.9 0 112 50.1 112 112z"/></svg>
						</div>
						<input id="guestsInput" name="guestsInput" read-only class="relative block w-full pl-10 py-5 rounded-md border-gray-300 bg-transparent focus:z-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
						<div class="pointer-events-none absolute inset-y-0 right-2 flex items-center pl-3">
							<svg  class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/></svg>
						</div>
					</div>

					<div id="menu-guests" class="invisible absolute flex flex-col place-items-center h-fit bg-gray-100 rounded-b-md mt-1 py-4 px-5 z-10">
						<div class="flex justify-end items-center gap-4 w-full">
							<div>Room:</div>
							<button type="button" onclick="reduceGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM184 232H328c13.3 0 24 10.7 24 24s-10.7 24-24 24H184c-13.3 0-24-10.7-24-24s10.7-24 24-24z"/></svg>
							</button>
							<div id="numOfGuests">0</div>
							<button type="button" onclick="addGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
							</button>
						</div>
						<div class="flex justify-end items-center gap-4 w-full">
							<div>Adult:</div>
							<button type="button" onclick="reduceGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM184 232H328c13.3 0 24 10.7 24 24s-10.7 24-24 24H184c-13.3 0-24-10.7-24-24s10.7-24 24-24z"/></svg>
							</button>
							<div id="numOfGuests">0</div>
							<button type="button" onclick="addGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
							</button>
						</div>
						<div class="flex justify-center items-center gap-4 w-full">
							<div>Children:</div>
							<button type="button" onclick="reduceGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM184 232H328c13.3 0 24 10.7 24 24s-10.7 24-24 24H184c-13.3 0-24-10.7-24-24s10.7-24 24-24z"/></svg>
							</button>
							<div id="numOfGuests">0</div>
							<button type="button" onclick="addGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
							</button>
						</div>
					</div>
				</div>
			</div>
			
			<input class="hidden" type="number" name="hotelRoomNum" id="hotelRoomNum" value="0">
			<input class="hidden" type="number" name="hotelAdultNum" id="hotelAdultNum" value="0">
			<input class="hidden" type="number" name="hotelChildrenNum" id="hotelChildrenNum" value="0">

			<div class="absolute -bottom-6 w-full grid place-items-center">			
				<button type="submit" class="w-full max-w-xl -mt-6 rounded-md border border-transparent bg-indigo-600 py-3 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">Search</button>
			</div>
		</form>

		<form id="restaurantui" class="hidden relative bg-white grid grid-cols-2 px-2 py-10 shadow sm:rounded-lg max-w-4xl w-full">
			<div class="my-2 col-span-2">
				<div class="relative mt-1 rounded-md shadow-sm">
					<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
						<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#5e5c64}</style><path d="M416 0C400 0 288 32 288 176V288c0 35.3 28.7 64 64 64h32V480c0 17.7 14.3 32 32 32s32-14.3 32-32V352 240 32c0-17.7-14.3-32-32-32zM64 16C64 7.8 57.9 1 49.7 .1S34.2 4.6 32.4 12.5L2.1 148.8C.7 155.1 0 161.5 0 167.9c0 45.9 35.1 83.6 80 87.7V480c0 17.7 14.3 32 32 32s32-14.3 32-32V255.6c44.9-4.1 80-41.8 80-87.7c0-6.4-.7-12.8-2.1-19.1L191.6 12.5c-1.8-8-9.3-13.3-17.4-12.4S160 7.8 160 16V150.2c0 5.4-4.4 9.8-9.8 9.8c-5.1 0-9.3-3.9-9.8-9L127.9 14.6C127.2 6.3 120.3 0 112 0s-15.2 6.3-15.9 14.6L83.7 151c-.5 5.1-4.7 9-9.8 9c-5.4 0-9.8-4.4-9.8-9.8V16zm48.3 152l-.3 0-.3 0 .3-.7 .3 .7z"/></svg>					
					</div>
				<input type="text" name="restaurant" id="restaurant" class="block w-full bg-gray-100 rounded-md border-gray-300 pl-10 py-5 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="restaurant name">
				</div>
			</div>
			<div class="absolute -bottom-6 w-full grid place-items-center">			
				<button type="submit" class="w-full max-w-xl -mt-6 rounded-md border border-transparent bg-indigo-600 py-3 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">Search</button>
			</div>
		</form>
		
		<form id="flightui" class="relative hidden bg-white grid grid-cols-2 px-2 py-10 shadow sm:rounded-lg max-w-4xl w-full">
			<div class="my-2 mx-1">
				<div class="relative mt-1 rounded-md shadow-sm">
					<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#5e5c64}</style><path d="M381 114.9L186.1 41.8c-16.7-6.2-35.2-5.3-51.1 2.7L89.1 67.4C78 73 77.2 88.5 87.6 95.2l146.9 94.5L136 240 77.8 214.1c-8.7-3.9-18.8-3.7-27.3 .6L18.3 230.8c-9.3 4.7-11.8 16.8-5 24.7l73.1 85.3c6.1 7.1 15 11.2 24.3 11.2H248.4c5 0 9.9-1.2 14.3-3.4L535.6 212.2c46.5-23.3 82.5-63.3 100.8-112C645.9 75 627.2 48 600.2 48H542.8c-20.2 0-40.2 4.8-58.2 14L381 114.9zM0 480c0 17.7 14.3 32 32 32H608c17.7 0 32-14.3 32-32s-14.3-32-32-32H32c-17.7 0-32 14.3-32 32z"/></svg>					
					</div>
				<input type="text" name="source" id="source" class="block w-full bg-gray-100 rounded-md border-gray-300 pl-10 py-5 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="source">
				</div>
			</div>
			<div class="my-2 mx-1">
				<div class="relative mt-1 rounded-md shadow-sm">
					<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
						<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 640 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#5e5c64}</style><path d="M.3 166.9L0 68C0 57.7 9.5 50.1 19.5 52.3l35.6 7.9c10.6 2.3 19.2 9.9 23 20L96 128l127.3 37.6L181.8 20.4C178.9 10.2 186.6 0 197.2 0h40.1c11.6 0 22.2 6.2 27.9 16.3l109 193.8 107.2 31.7c15.9 4.7 30.8 12.5 43.7 22.8l34.4 27.6c24 19.2 18.1 57.3-10.7 68.2c-41.2 15.6-86.2 18.1-128.8 7L121.7 289.8c-11.1-2.9-21.2-8.7-29.3-16.9L9.5 189.4c-5.9-6-9.3-14-9.3-22.5zM32 448H608c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32zm96-80a32 32 0 1 1 64 0 32 32 0 1 1 -64 0zm128-16a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>
					</div>
				<input type="text" name="destination" id="destination" class="block w-full bg-gray-100 rounded-md border-gray-300 pl-10 py-5 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="destination">
				</div>
			</div>

			<div class="my-2 mx-1">
				<div class="flex rounded-md shadow-sm">
					<div class="relative flex flex-grow items-stretch focus-within:z-10">
						<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
							<svg class="h-5 w-5 text-gray-400 bg-gray-100" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
								<style>svg{fill:#5e5c64}</style>
								<path  d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/>
							</svg>
						</div>
						<input type="date" name="flightDate" id="flightDate" class="block w-full py-5  bg-gray-100 rounded-md border-gray-300 pl-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="John Smith">
					</div>
				</div>
			</div>
			<div class="my-2 mx-1 rounded-md shadow-sm bg-gray-200">
				<div>
				  <label for="itineraryType" class="sr-only">Itinerary Type</label>
				  <select id="itineraryType" name="itineraryType" class="p-5  relative block w-full rounded-none rounded-t-md border-gray-300 bg-transparent focus:z-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
					<option value="ONE_WAY">One Way</option>
					<option value="ROUND_TRIP">Round Trip</option>
				  </select>
				</div>
			</div>
			<div class="my-2 mx-1">
				<div class="relative mt-1 rounded-md shadow-sm">
					<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
						<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#5e5c64}</style><path d="M112 48a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm40 304V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V256.9L59.4 304.5c-9.1 15.1-28.8 20-43.9 10.9s-20-28.8-10.9-43.9l58.3-97c17.4-28.9 48.6-46.6 82.3-46.6h29.7c33.7 0 64.9 17.7 82.3 46.6l58.3 97c9.1 15.1 4.2 34.8-10.9 43.9s-34.8 4.2-43.9-10.9L232 256.9V480c0 17.7-14.3 32-32 32s-32-14.3-32-32V352H152z"/></svg>
					</div>
				<input type="number" name="numAdults" id="numAdults" class="block w-full bg-gray-100 rounded-md border-gray-300 pl-10 py-5 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="adults">
				</div>
			</div>
			<div class="my-2 mx-1">
				<div class="relative mt-1 rounded-md shadow-sm">
					<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
						<svg xmlns="http://www.w3.org/2000/svg" height="1.5em" viewBox="0 0 448 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><style>svg{fill:#5e5c64}</style><path d="M272 48a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zm-8 187.3l47.4 57.1c11.3 13.6 31.5 15.5 45.1 4.2s15.5-31.5 4.2-45.1l-73.7-88.9c-18.2-22-45.3-34.7-73.9-34.7H177.1c-33.7 0-64.9 17.7-82.3 46.6l-58.3 97c-9.1 15.1-4.2 34.8 10.9 43.9s34.8 4.2 43.9-10.9L120 256.9V480c0 17.7 14.3 32 32 32s32-14.3 32-32V352h16V480c0 17.7 14.3 32 32 32s32-14.3 32-32V235.3zM352 376c0-4.4 3.6-8 8-8s8 3.6 8 8V488c0 13.3 10.7 24 24 24s24-10.7 24-24V376c0-30.9-25.1-56-56-56s-56 25.1-56 56v8c0 13.3 10.7 24 24 24s24-10.7 24-24v-8z"/></svg>
					</div>
				<input type="number" name="numSeniors" id="numSeniors" class="block w-full bg-gray-100 rounded-md border-gray-300 pl-10 py-5 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm" placeholder="seniors">
				</div>
			</div>
			<div class="my-2 mx-1 rounded-md shadow-sm bg-gray-200">
				<div>
				  <label for="sortOrder" class="sr-only">Sort Order</label>
				  <select id="sortOrder" name="sortOrder" class="p-5  relative block w-full rounded-none rounded-t-md border-gray-300 bg-transparent focus:z-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
					<option class="ML_BEST_VALUE">Best Value</option>
					<option value="DURATION">Duration</option>
					<option value="PRICE">Price</option>
					<option value="EARLIEST_OUTBOUND_DEPARTURE">Earliest Outbound Departure</option>
					<option value="EARLIEST_OUTBOUND_ARRIVAL">Earliest Outbound Arrival</option>
					<option value="LATEST_OUTBOUND_DEPARTURE">Latest Outbound Departure</option>
					<option value="LATEST_OUTBOUND_ARRIVAL">Latest Outbound Arrival</option>
				  </select>
				</div>
			</div>
			<div class="m-2 -space-y-px rounded-md shadow-sm bg-gray-200">
				<div>
				  <label for="classOfService" class="sr-only">Class of Service</label>
				  <select id="classOfService" name="classOfService" class="p-5  relative block w-full rounded-none rounded-t-md border-gray-300 bg-transparent focus:z-10 focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm">
					<option value="ECONOMY">Economy</option>
					<option value="PREMIUM_ECONOMY">Economy</option>
					<option value="BUSINESS">Business</option>
					<option value="FIRST">First</option>
				  </select>
				</div>
			</div>
			<div class="absolute -bottom-6 w-full grid place-items-center">			
				<button type="submit" class="w-full max-w-xl -mt-6 rounded-md border border-transparent bg-indigo-600 py-3 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">Search</button>
			</div>
		</form>

	</div>
</body>
</html>