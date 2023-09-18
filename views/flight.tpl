<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>List of Flights</title>
</head>
<body>
    <div class="grid grid-cols-1 gap-4 bg-gray-100">
        {{$origin:= .Flight.Origin}}
        {{$destintaion:= .Flight.Destination}}
        {{$departure:= .Flight.Departure}}
        {{range .Flight.Flights}}
        <div class="bg-white shadow sm:rounded-lg px-4 sm:px-6 max-w-7xl">
            <div class=" pt-5 sm:pt-6">
                <div class="flex justify-between">
                    <h3 class="text-lg font-medium leading-6 text-gray-900">{{$origin}} -> {{$destintaion}} </h3>
                    <h3 class="text-md font-medium leading-6 text-gray-900">{{$departure}} </h3>
                </div>
            </div>
            <div class="my-6">
                <div class="rounded-md bg-blue-50 px-6 py-5 sm:flex sm:items-start sm:justify-between">
                    <div class="mt-3 sm:mt-0 sm:ml-4">
                        <div class="text-sm font-medium text-blue-600">Flight-{{.Id}}</div>
                        <div class="mt-1 text-sm text-gray-600 sm:flex sm:items-center">
                            <div>Price: {{.Price}} + <span class="text-sm text-gray-500">{{.Vat}}</span> {{.Currency}}</div>
                            {{if .MaxWeight}}
                            <span class="hidden sm:mx-2 sm:inline" aria-hidden="true">&middot;</span>
                            <div class="mt-1 sm:mt-0">Max Weight: {{.MaxWeight}}</div>
                            {{end}}
                            {{if .NumberOfUnits}}
                            <span class="hidden sm:mx-2 sm:inline" aria-hidden="true">&middot;</span>
                            <div class="mt-1 sm:mt-0">Baggage limit: {{.NumberOfUnits}}</div>
                            {{end}}
                        </div>
                    </div>
                    <a class="mt-4 sm:mt-0 sm:ml-6 sm:flex-shrink-0" href="{{.Url}}">
                        <button type="button" class="inline-flex items-center rounded-md border border-gray-300 bg-white px-4 py-2 font-medium shadow-sm text-indigo-700 hover:bg-indigo-200 focus:outline-none sm:text-sm">Book Ticket</button>
                    </a>
                </div>
                  
            </div>
        </div> 
        {{end}}      
    </div>
</body>
</html>
