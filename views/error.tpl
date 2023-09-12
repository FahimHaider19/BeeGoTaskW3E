<!DOCTYPE html>
<html lang="en">
<head class="h-full">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Error</title>
</head>
<body class="h-full">
    <div class="flex min-h-full flex-col bg-white pt-16 pb-12">
        <main class="mx-auto flex w-full max-w-7xl flex-grow flex-col justify-center px-6 lg:px-8">
            <div class="flex flex-shrink-0 justify-center">
            <a href="/" class="inline-flex">
                <img class="h-12 w-auto" src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600" alt="">
            </a>
            </div>
            <div class="py-16">
            <div class="text-center">
                <p class="text-base font-semibold text-indigo-600">{{.Error.Code}}</p>
                <h1 class="mt-2 text-4xl font-bold tracking-tight text-gray-900 sm:text-5xl">{{.Error.Message}}</h1>
                <p class="mt-2 text-base text-gray-500">{{.Error.SubMessage}}</p>
                <div class="mt-6">
                <a href="/" class="text-base font-medium text-indigo-600 hover:text-indigo-500">
                    Go back home
                    <span aria-hidden="true"> &rarr;</span>
                </a>
                </div>
            </div>
            </div>
        </main>
    </div>
</body>
</html>

