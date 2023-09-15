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
      <div class="mx-auto mt-6 max-w-2xl sm:px-6 lg:grid lg:max-w-7xl grid-cols-4 lg:gap-x-8 lg:px-8">
        <div class="aspect-[4/3] overflow-hidden rounded-lg lg:block col-span-2 h-full">
          <img src="{{index .Photos 0}}" alt="Two each of gray, white, and black shirts laying flat." class="h-full w-full object-cover object-center">
        </div>
        <div class="lg:grid lg:grid-cols-1 lg:gap-y-8">
          <div class="aspect-[4/3] overflow-hidden rounded-lg">
            <img src="{{index .Photos 1}}" class="h-full w-full object-cover object-center">
          </div>
          <div class="aspect-[4/3] overflow-hidden rounded-lg">
            <img src="{{index .Photos 2}}" alt="Model wearing plain gray basic tee." class="h-full w-full object-cover object-center">
          </div>
        </div>
        <div class="lg:grid lg:grid-cols-1 lg:gap-y-8">
            <div class="aspect-[4/3] overflow-hidden rounded-lg">
              <img src="{{index .Photos 3}}" alt="Model wearing plain black basic tee." class="h-full w-full object-cover object-center">
            </div>
            <div class="aspect-[4/3] overflow-hidden rounded-lg">
              <img src="{{index .Photos 4}}" alt="Model wearing plain gray basic tee." class="h-full w-full object-cover object-center">
            </div>
        </div>
      </div>
  
      <!-- Product info -->
      <div class="mx-auto max-w-2xl px-4 pt-10 pb-16 sm:px-6 lg:grid lg:max-w-7xl lg:px-8 lg:pt-16 lg:pb-24">
        <div class="lg:col-span-2 lg:pr-8">
          <h1 class="text-2xl font-bold tracking-tight text-gray-900 sm:text-3xl">Basic Tee 6-Pack</h1>
        </div>
  
        <!-- Options -->

  
        <div class="py-10 lg:col-span-2 lg:col-start-1 lg:pt-6 lg:pb-16 lg:pr-8">
          <!-- Description and details -->
          <div>
            <h3 class="sr-only">Description</h3>
  
            <div class="space-y-6">
              <p class="text-base text-gray-900">{{.Description}}</p>
            </div>
          </div>
  
          <div class="mt-10">
            <h3 class="text-sm font-medium text-gray-900">Highlights</h3>
  
            <div class="mt-4">
              <ul role="list" class="list-disc space-y-2 pl-4 text-sm">
                <li class="text-gray-400"><span class="text-gray-600">Hand cut and sewn locally</span></li>
  
                <li class="text-gray-400"><span class="text-gray-600">Dyed with our proprietary colors</span></li>
  
                <li class="text-gray-400"><span class="text-gray-600">Pre-washed &amp; pre-shrunk</span></li>
  
                <li class="text-gray-400"><span class="text-gray-600">Ultra-soft 100% cotton</span></li>
              </ul>
            </div>
          </div>
  
          <div class="mt-10">
            <h2 class="text-sm font-medium text-gray-900">Details</h2>
  
            <div class="mt-4 space-y-6">
              <p class="text-sm text-gray-600">The 6-Pack includes two black, two white, and two heather gray Basic Tees. Sign up for our subscription service and be the first to get new, exciting colors, like our upcoming &quot;Charcoal Gray&quot; limited release.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>  
</body>
</html>