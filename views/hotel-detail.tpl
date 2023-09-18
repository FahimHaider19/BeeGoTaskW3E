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
<div class="bg-white">
    <div class="pt-6">
      <!-- Image gallery -->
      {{$photos := .Data.Photos}}
      <div class="mx-auto mt-6 max-w-2xl sm:px-6 lg:grid lg:max-w-7xl grid-cols-4 lg:gap-x-8 lg:px-8">
        <div class="aspect-[4/3] overflow-hidden rounded-lg lg:block col-span-2 h-full">
          <img src="{{getarr $photos 0}}" alt="Two each of gray, white, and black shirts laying flat." class="h-full w-full object-cover object-center">
        </div>
        <div class="lg:grid lg:grid-cols-1 lg:gap-y-8">
          <div class="aspect-[4/3] overflow-hidden rounded-lg">
            <img src="{{getarr $photos 1}}" class="h-full w-full object-cover object-center">
          </div>
          <div class="aspect-[4/3] overflow-hidden rounded-lg">
            <img src="{{getarr $photos 2}}" alt="Model wearing plain gray basic tee." class="h-full w-full object-cover object-center">
          </div>
        </div>
        <div class="lg:grid lg:grid-cols-1 lg:gap-y-8">
            <div class="aspect-[4/3] overflow-hidden rounded-lg">
              <img src="{{getarr $photos 3}}" alt="Model wearing plain black basic tee." class="h-full w-full object-cover object-center">
            </div>
            <div class="aspect-[4/3] overflow-hidden rounded-lg">
              <img src="{{getarr $photos 4}}" alt="Model wearing plain gray basic tee." class="h-full w-full object-cover object-center">
            </div>
        </div>
      </div>
  
      <!-- Product info -->
      <div class="mx-auto max-w-2xl px-4 pt-10 pb-16 sm:px-6 lg:grid lg:max-w-7xl lg:px-8 lg:pt-16 lg:pb-24">
        <div class="lg:col-span-2 lg:pr-8">
          <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">{{.Data.Name}}</h1>
        </div>
  
        <!-- Options -->

  
        <div class="py-10 lg:col-span-2 lg:col-start-1 lg:pt-6 lg:pb-16 lg:pr-8">
          <!-- Description and details -->
          <div>
            <h3 class="sr-only">Description</h3>
  
            <div class="space-y-6">
              <p class="text-base text-gray-900">{{.Data.Description}}</p>
            </div>
          </div>
  
          <!-- <div class="mt-10">
            <h3 class="text-xl font-medium text-gray-900">Features</h3>
            <div class="mt-4">
              <div class="flex">
                <span class="inline-flex items-center rounded-md bg-gray-100 px-2.5 py-0.5 text-sm font-medium text-gray-800">Feature</span>
              </div>
            </div>
          </div> -->
  
          <div class="mt-10">
            <h2 class="text-xl font-medium text-gray-900">Reviews</h2>
  
            <div class="mt-4 space-y-6">
              <div class="-my-12 divide-y divide-gray-200">
                {{range .Data.Reviews}}
                <div class="py-12">
                  <div class="flex items-center">
                    {{if .UserAvatarURL}}
                    <img src="{{.UserAvatarURL}}" alt="User Photo" class="h-12 w-12 rounded-full">
                    {{else}}
                    <img src="https://ui-avatars.com/api/?name={{.GuestName}}" alt="User Photo" class="h-12 w-12 rounded-full">
                    {{end}}
                    <div class="ml-4">
                      <h4 class="text-sm font-bold text-gray-900">{{.GuestName}}</h4>
                    </div>
                  </div>
                  <div class="mt-4 space-y-6 text-base italic text-gray-700">
                    <p class="text-lg font-semibold">{{.Title}}</p>
                    <p>{{.PositiveText}}</p>
                    <p>{{.NegativeText}}</p>
                  </div>
                </div>
                {{end}}
                <!-- More reviews... -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>  
</body>
</html>