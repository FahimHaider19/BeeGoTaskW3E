<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>List of Flights</title>
</head>
<body>
    <div class="grid grid-cols-1 gap-4 sm:grid-cols-2">
        {{range .Data.Flights}}
        <div class="relative flex flex-col space-x-3 rounded-lg border border-gray-300 bg-white px-6 py-5 shadow-sm focus-within:ring-2 focus-within:ring-indigo-500 focus-within:ring-offset-2 hover:border-gray-400">
          <p class="text-sm font-medium text-gray-900">{{.ID}}</p>
          <p class="truncate text-sm text-gray-700">
            Price: {{.Price.Price.Value}} + <span class="text-sm text-gray-500">{{.Price.VAT.Value}}</span> {{.Price.Price.Currency.Code}}
          </p>
        </div>
        {{end}}
    </div>
</body>
</html>
