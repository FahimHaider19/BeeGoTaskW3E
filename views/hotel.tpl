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
<header class="bg-gray-800">
    <div class="mx-auto max-w-7xl px-2 sm:px-4 lg:divide-y lg:divide-gray-700 lg:px-8">
      <div class="relative flex h-16 justify-between">
        <div class="relative z-10 flex px-2 lg:px-0">
          <div class="flex flex-shrink-0 items-center">
            <img class="block h-8 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=cyan&shade=500" alt="Your Company">
          </div>
        </div>
        <div class="relative z-10 flex items-center lg:hidden">
          <!-- Mobile menu button -->
          <button type="button" class="inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white" aria-controls="mobile-menu" aria-expanded="false">
            <span class="sr-only">Open menu</span>
            <!--
              Icon when menu is closed.
  
              Heroicon name: outline/bars-3
  
              Menu open: "hidden", Menu closed: "block"
            -->
            <svg class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
            </svg>
            <!--
              Icon when menu is open.
  
              Heroicon name: outline/x-mark
  
              Menu open: "block", Menu closed: "hidden"
            -->
            <svg class="hidden h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
        <div class="hidden lg:relative lg:z-10 lg:ml-4 lg:flex lg:items-center">
          <button onclick="Menu2()" type="button" class="flex-shrink-0 rounded-full bg-white p-1 text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
            <span class="sr-only">View notifications</span>
            <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                <path fill-rule="evenodd" d="M9 3.5a5.5 5.5 0 100 11 5.5 5.5 0 000-11zM2 9a7 7 0 1112.452 4.391l3.328 3.329a.75.75 0 11-1.06 1.06l-3.329-3.328A7 7 0 012 9z" clip-rule="evenodd" />
            </svg>
          </button>
  
          <div class="relative ml-4 flex-shrink-0">
            <div>
              <button type="button" class="flex rounded-full bg-gray-800 text-sm text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800" id="user-menu-button" aria-expanded="false" aria-haspopup="true">
                <span class="sr-only">Open user menu</span>
                <img class="h-8 w-8 rounded-full" src="https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=2&w=256&h=256&q=80" alt="">
              </button>
            </div>
          </div>
        </div>
      </div>


      <div id="menu2" class="hidden grid grid-cols-1 lg:grid-cols-7 px-2 py-10 max-w-7xl w-full">
			<div class="my-2 col-span-2">
				<div class="relative rounded-md shadow-sm h-full">
					<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
						<svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
						<path d="M3 4a2 2 0 00-2 2v1.161l8.441 4.221a1.25 1.25 0 001.118 0L19 7.162V6a2 2 0 00-2-2H3z" />
						<path d="M19 8.839l-7.77 3.885a2.75 2.75 0 01-2.46 0L1 8.839V14a2 2 0 002 2h14a2 2 0 002-2V8.839z" />
						</svg>
					</div>
				<input type="email" name="email" id="email" class="block h-full w-full bg-gray-100 rounded-md border-gray-300 pl-10 py-5 focus:border-cyan-500 focus:ring-cyan-500 sm:text-sm" placeholder="you@example.com">
				</div>
			</div>

			<div class="my-2 lg:mx-2 col-span-2">
				<div class="flex rounded-md shadow-sm h-full">
					<div class="relative w-1/2 flex items-stretch focus-within:z-10">
						<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
							<svg class="h-5 w-5 text-gray-400 bg-gray-100" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
								<style>svg{fill:#5e5c64}</style>
								<path  d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/>
							</svg>
						</div>
						<input type="date" name="date1" id="date1" class="block w-full py-5  bg-gray-100 rounded-none rounded-l-md border-gray-300 pl-10 focus:border-cyan-500 focus:ring-cyan-500 sm:text-sm" placeholder="John Smith">
					</div>
					<div class="relative w-1/2 flex flex-grow items-stretch focus-within:z-10">
						<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
							<svg class="h-5 w-5 text-gray-400 bg-gray-100" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 448 512">
								<style>svg{fill:#5e5c64}</style>
								<path  d="M128 0c17.7 0 32 14.3 32 32V64H288V32c0-17.7 14.3-32 32-32s32 14.3 32 32V64h48c26.5 0 48 21.5 48 48v48H0V112C0 85.5 21.5 64 48 64H96V32c0-17.7 14.3-32 32-32zM0 192H448V464c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V192zm64 80v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm128 0v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H208c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V272c0-8.8-7.2-16-16-16H336zM64 400v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H80c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H208zm112 16v32c0 8.8 7.2 16 16 16h32c8.8 0 16-7.2 16-16V400c0-8.8-7.2-16-16-16H336c-8.8 0-16 7.2-16 16z"/>
							</svg>
						</div>
						<input type="date" name="date2" id="date2" class="block w-full py-5  bg-gray-100 rounded-none rounded-r-md border-gray-300 pl-10 focus:border-cyan-500 focus:ring-cyan-500 sm:text-sm" placeholder="John Smith">
					</div>
				</div>
			</div>

			<div class="bg-gray-100 my-2 col-span-2 rounded-md">
				<label for="country" class="sr-only">Country</label>
				<div class="relative mt-1 rounded-md shadow-sm">
					<div onclick="showGuestsMenu()">
						<div class="pointer-events-none absolute inset-y-0 left-0 flex items-center pl-3">
							<svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
							<path d="M3 4a2 2 0 00-2 2v1.161l8.441 4.221a1.25 1.25 0 001.118 0L19 7.162V6a2 2 0 00-2-2H3z" />
							<path d="M19 8.839l-7.77 3.885a2.75 2.75 0 01-2.46 0L1 8.839V14a2 2 0 002 2h14a2 2 0 002-2V8.839z" />
							</svg>
						</div>
						<input id="guestsInput" name="guestsInput" read-only class="relative block w-full pl-10 py-5 rounded-md border-gray-300 bg-transparent focus:z-10 focus:border-cyan-500 focus:ring-cyan-500 sm:text-sm">
						<div class="pointer-events-none absolute inset-y-0 right-2 flex items-center pl-3">
							<svg  class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/></svg>
						</div>
					</div>
					
					<div id="menu-guests" class="invisible absolute flex flex-col place-items-center h-fit bg-gray-100 rounded-b-md mt-1 py-4 px-5 z-20">
						<div class="flex justify-end items-center gap-4 w-full">
							<div>Room:</div>
							<button onclick="reduceGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM184 232H328c13.3 0 24 10.7 24 24s-10.7 24-24 24H184c-13.3 0-24-10.7-24-24s10.7-24 24-24z"/></svg>
							</button>
							<div id="numOfGuests">0</div>
							<button onclick="addGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
							</button>
						</div>
						<div class="flex justify-end items-center gap-4 w-full">
							<div>Adult:</div>
							<button onclick="reduceGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM184 232H328c13.3 0 24 10.7 24 24s-10.7 24-24 24H184c-13.3 0-24-10.7-24-24s10.7-24 24-24z"/></svg>
							</button>
							<div id="numOfGuests">0</div>
							<button onclick="addGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
							</button>
						</div>
						<div class="flex justify-center items-center gap-4 w-full">
							<div>Children:</div>
							<button onclick="reduceGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM184 232H328c13.3 0 24 10.7 24 24s-10.7 24-24 24H184c-13.3 0-24-10.7-24-24s10.7-24 24-24z"/></svg>
							</button>
							<div id="numOfGuests">0</div>
							<button onclick="addGuest()">
								<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><style>svg{fill:#5e5c64}</style><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344V280H168c-13.3 0-24-10.7-24-24s10.7-24 24-24h64V168c0-13.3 10.7-24 24-24s24 10.7 24 24v64h64c13.3 0 24 10.7 24 24s-10.7 24-24 24H280v64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg>
							</button>
						</div>
					</div>
				</div>
			</div>
            <button type="submit" class="w-full m-2 rounded-md border border-transparent bg-indigo-600 py-3 px-4 text-base font-medium text-white shadow-sm hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 focus:ring-offset-gray-50">Checkout</button>
		</div>
    </div>
  </header>

  <div class="grid place-items-center">
    <div class="max-w-7xl z-0">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 place-items-center grid-flow-row auto-rows-max py-6">
          {{range .Hotels}}
            <!-- card -->
            <div class="max-w-xs h-full rounded overflow-hidden shadow-lg"> 
              <div class="w-full relative">
                <img class="w-full h-80" src={{.Photo}} alt="Sunset in the mountains">
                <div class="absolute py-1 px-2 bg-white bg-opacity-50 bottom-2 left-2 rounded-md">
                  <span class="font-bold">{{.Price}}$</span>
                  <span class="text-sm">per night</span>
                </div>
              </div>
              
              <div class="p-4 flex flex-col justify-between">
                <div class="flex font-bold text-xs text-gray-700">
                  {{ if .Bed }}
                    <div class="font-bold text-xs mb-2 text-gray-700">{{.Bed}} Bedroom .</div>
                  {{ end }}
                  {{ if .Livingroom }}
                    <div class="font-bold text-xs mb-2 text-gray-700">{{.Livingroom}} Livingroom .</div>
                  {{ end }}
                  {{ if .Kitchen }}
                    <div class="font-bold text-xs mb-2 text-gray-700">{{.Kitchen}} Kitchen .</div>
                  {{ end }}
                </div>
                <div class="font-bold text-xl mb-2">{{.Name}}</div>
                <div class="flex items-center py-1">
                  <span class="font-bold pr-1 text-green-600">{{.Rating}}</span>
                  {{ $rating := .Rating }}
                  {{ $emptyStar := .NonStarRating}}
                  {{ range $i, $rating := until $rating }}
                    <svg id="full-star{{$i}}" class="fill-current text-green-600" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><path d="M316.9 18C311.6 7 300.4 0 288.1 0s-23.4 7-28.8 18L195 150.3 51.4 171.5c-12 1.8-22 10.2-25.7 21.7s-.7 24.2 7.9 32.7L137.8 329 113.2 474.7c-2 12 3 24.2 12.9 31.3s23 8 33.8 2.3l128.3-68.5 128.3 68.5c10.8 5.7 23.9 4.9 33.8-2.3s14.9-19.3 12.9-31.3L438.5 329 542.7 225.9c8.6-8.5 11.7-21.2 7.9-32.7s-13.7-19.9-25.7-21.7L381.2 150.3 316.9 18z"/></svg>
                  {{ end }}
                  {{ range $i, $emptyStar := until $emptyStar }}
                    <svg id="blank-star{{$i}}" class="fill-current text-green-600" xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 576 512"><path d="M287.9 0c9.2 0 17.6 5.2 21.6 13.5l68.6 141.3 153.2 22.6c9 1.3 16.5 7.6 19.3 16.3s.5 18.1-5.9 24.5L433.6 328.4l26.2 155.6c1.5 9-2.2 18.1-9.6 23.5s-17.3 6-25.3 1.7l-137-73.2L151 509.1c-8.1 4.3-17.9 3.7-25.3-1.7s-11.2-14.5-9.7-23.5l26.2-155.6L31.1 218.2c-6.5-6.4-8.7-15.9-5.9-24.5s10.3-14.9 19.3-16.3l153.2-22.6L266.3 13.5C270.4 5.2 278.7 0 287.9 0zm0 79L235.4 187.2c-3.5 7.1-10.2 12.1-18.1 13.3L99 217.9 184.9 303c5.5 5.5 8.1 13.3 6.8 21L171.4 443.7l105.2-56.2c7.1-3.8 15.6-3.8 22.6 0l105.2 56.2L384.2 324.1c-1.3-7.7 1.2-15.5 6.8-21l85.9-85.1L358.6 200.5c-7.8-1.2-14.6-6.1-18.1-13.3L287.9 79z"/></svg>
                  {{ end }}
                  <span class="text-sm px-2 text-gray-600">({{.Reviews}} reviews)</span>
                </div>
                <div class="flex items-start py-2">
                  <svg class="fill-current text-gray-500" xmlns="http://www.w3.org/2000/svg" height="1.15em" viewBox="0 0 384 512"><style>svg{fill:#5e5c64}</style><path d="M215.7 499.2C267 435 384 279.4 384 192C384 86 298 0 192 0S0 86 0 192c0 87.4 117 243 168.3 307.2c12.3 15.3 35.1 15.3 47.4 0zM192 128a64 64 0 1 1 0 128 64 64 0 1 1 0-128z"/></svg> 
                  <span class="text-gray-700 text-xs px-2 truncate">{{.Location}}, {{.City}}</span>
                </div>
                <a href="/hotel/details/{{.IdDetail}}?checkin_date={{.CheckinDate}}&checkout_date={{.CheckoutDate}}" class="flex justify-center py-2">
                  <button class="bg-green-600 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">View Details</button>
                </a>
              </div>
            </div>
          {{end}}
        </div>
    </div>
  </div>
</body>
</html>