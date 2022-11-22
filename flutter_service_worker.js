'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "b178b982d5b34733b52cb36117288e5a",
"index.html": "b028ea7c63e7cce0e6b68eadbc4e4f53",
"/": "b028ea7c63e7cce0e6b68eadbc4e4f53",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"main.dart.js": "d4bafecb575c854592b898bedcc431bb",
"favicon.png": "85812388bd37c0d2bea08eecb8e99afe",
"manifest.json": "cd5f92954660745f6b1c54187427ba03",
"assets/FontManifest.json": "be4e7fc0d3c67a048a7a89bec4d76b20",
"assets/assets/translations/pt-BR.yaml": "035252b65ecae487797ae7dfc82b9500",
"assets/assets/translations/de-DE.yaml": "8cc13bd85f8040bfb19f29fb683f7ca2",
"assets/assets/translations/en-US.yaml": "e262b0fae726bbad49868352fcaba390",
"assets/assets/icon/icon.png": "651340b46ddaff0011be5abbfb67b8bc",
"assets/packages/easy_localization/i18n/ar-DZ.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/ar.json": "acc0a8eebb2fcee312764600f7cc41ec",
"assets/packages/easy_localization/i18n/en-US.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/easy_localization/i18n/en.json": "5f5fda8715e8bf5116f77f469c5cf493",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/packages/yaru_widgets/assets/ubuntu_logo.png": "1cd87df893e3c75b7df2e850e0dfc1d7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/yaru/src/text/fonts/Ubuntu-RI.ttf": "6da3b4e2adcbcf2889e59c81d2326a43",
"assets/packages/yaru/src/text/fonts/Ubuntu-LI.ttf": "d8d09723b71ebb22bc31881877609622",
"assets/packages/yaru/src/text/fonts/Ubuntu-MI.ttf": "137201ae9563c760964063e122d587b7",
"assets/packages/yaru/src/text/fonts/Ubuntu-BI.ttf": "f270899858f8204b62043167ac8d9552",
"assets/packages/yaru/src/text/fonts/Ubuntu-R.ttf": "7f0b42d1d6a4d3e646c558185f6711ea",
"assets/packages/yaru/src/text/fonts/Ubuntu-B.ttf": "008e6bc48c8eaa5d2855d57e6b0b8595",
"assets/packages/yaru/src/text/fonts/Ubuntu-M.ttf": "2aaaafd5fe853746266cad7eafcc871e",
"assets/packages/yaru/src/text/fonts/Ubuntu-L.ttf": "2759de5c01527bd9730b4d1838e6c938",
"assets/AssetManifest.json": "03f15463301397e9fa2b51b065500886",
"assets/fonts/Monocraft.otf": "f301197b08c8e25e0212ef95c1039ad6",
"assets/fonts/FiraCode-Regular.ttf": "a09618fdaaa2aef4b7b45e26b7267763",
"assets/fonts/JetBrainsMonoNL-Regular.ttf": "fbd467fbc7230e0bcfc20de2e15b3777",
"assets/fonts/Hack-Regular.ttf": "d9ab192896af1ab48c760f3368842b79",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/shaders/ink_sparkle.frag": "6445524186602fdfbf57025a6542549c",
"assets/NOTICES": "950a055f023be7c16dc467ca4123795e",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"icons/Icon-512.png": "0b285219bbaa1d42b22d3f4da97298d9",
"icons/Icon-192.png": "f7234cd5c3a8efe6b29d43e6ae0df608",
"icons/Icon-maskable-192.png": "f7234cd5c3a8efe6b29d43e6ae0df608",
"icons/Icon-maskable-512.png": "0b285219bbaa1d42b22d3f4da97298d9"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
