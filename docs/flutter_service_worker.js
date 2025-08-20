'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "ef1a27de28ed85f232e264ae2c4d80a8",
".git/config": "8b3eaf3a694ff2f9cc2242e84bc268c9",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "99b8c7e6224a7300a85c656eceb8dae6",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "4220e56e54710feb5c95f7772932ddcf",
".git/logs/refs/heads/main": "4220e56e54710feb5c95f7772932ddcf",
".git/objects/02/1d4f3579879a4ac147edbbd8ac2d91e2bc7323": "9e9721befbee4797263ad5370cd904ff",
".git/objects/05/8adf8b7013c311abd4066074f58c7a5bfa539f": "e7c3e91706033f76bbaefaa7283772f5",
".git/objects/06/85d4003c6a8e3077668dc956d71fcf3d8acaa2": "e49e8d7386e587d8c54ed5725fa6acc3",
".git/objects/1a/42fb2fdac9c4262a87c44bc523a78f179c450b": "f16a18afe379173cd9114d6bee6b0f23",
".git/objects/1c/6202a7d8da0a687912822ee38400c0bed8647b": "31a2c915bf799a5b51f4e842b0698b4d",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/20/66a20e72e87c488894274505b4ba680f4394f9": "83ff800caaf31d1294fa06c7ddc83ef5",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/2d/f1a6f506fa15aa8d1ad9d6d0eb5140cadc7258": "81f30bd3459acefa076a480ad18bdda1",
".git/objects/38/3e9d2d8aabeac49722d748bc72569fe93086e1": "21d0da3e6253fd90b273d83ae227586f",
".git/objects/3e/ba5c803a57c718ce1eaf2a25dd28761c16669d": "ab4b613823fb5b2c3973b359929c93a5",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/57/1368a7c4362dbe2cbc86da5ef86dbeeaaf863b": "30a856e57d484a7f3df163982f48880b",
".git/objects/5f/b69fce6a3bd09868584aebf9949ab29004baf2": "151cb86e41f76413db4e2340f7a3f3ad",
".git/objects/62/b4aa8b5ad72f44057efdf07b6594954bc101e5": "5c46af810ae6450c2f5888259c4c8e4a",
".git/objects/6a/55e447b7cb08c32ba842a0c0c64768a4e1f570": "a6d6c3187890958558492c54b5c60621",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/6e/81f95c1864d85c04c778956e19c2345cfae335": "71f43d1a07ffa4dff8b32026e1153352",
".git/objects/74/938338eddbad556f5fffd95d55c03b7cfd46fe": "955848aa2b3a5354e4bb4286cf8eed66",
".git/objects/77/4f63d2de8d050ddafec07225ef8cc4a68f87ac": "edae5822bcb4b00269f6d26ab778f0f6",
".git/objects/79/d77cb3fc7493eb69485f0d69ce80289162ae8b": "cfee67bc197c536173edda4995da28ba",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/objects/7b/0a4a67e4c090256ff6d65928ab858193d6c1ec": "bc0e470a7dd700112459a4462301814c",
".git/objects/7c/2bd785c5de72dbf4bcffaef834326a3371a9e9": "bbd4fade0d9cad98071a672baf7d778a",
".git/objects/81/55af35545f23ba65f5a608f7663f58cf60ca7b": "513ea042003a088fa5a6c0c66ed65996",
".git/objects/83/7d94e3b3c40fbf40c2a0966c7e4aecdd619141": "db640a548f721ce81652dc6105e60933",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/96/d534d8e2fbaa12ed3d9e990ce051ef84e19fef": "79b0b77176da800d43416f2dff814bad",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9c/a1fde772e458536a56ae1f55966dfc742e5cda": "78ece502a43dc98b8128efad9dfabd01",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/a7/def10323ff6a6cef8ed622a7ce82122558e3a6": "370ee662a11ff9952944af019c419672",
".git/objects/b0/b0ee61626d369d583f4ac827d64ec23614549b": "6e7783130155505c5439e01b70c340d5",
".git/objects/b2/74cea5fd45e98e1dbaf3b8814fd56d82181174": "3e69f693b8cbc87491d9bf51b01720f8",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c0/15ba57e08ae7c35e204d36b8e9eb92bc8592fb": "4a13337dbe75e84c1fa938b6ec195599",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/ce/47713b7a6317460348994ee870e2fafbab612d": "fa11448adc713d4f62e224562bdc4d03",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/015a67290e6e24cf20e0b70cd8445271fa0841": "7098378545642b359190db5305764cb3",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/d8/9b68b7dee5990a1adcbccda08aefa9c24f355b": "6cdd0a0f9f53ae23083411ab6fce73b8",
".git/objects/da/5f39425692d4377556445f9c61ae03e14b6f66": "0a1636e537f1a7fbbda01351f07c7a33",
".git/objects/dc/66973a7179d45e87d61abd83069103c79b6f8c": "5790e1c50a9a8b027e3a48fcad8bef2e",
".git/objects/e3/e9ee754c75ae07cc3d19f9b8c1e656cc4946a1": "14066365125dcce5aec8eb1454f0d127",
".git/objects/e4/4cfb40ce327071ea3c228517d4d41b8dec742d": "a1d63f1e6d0d4a60259f796280cdaa2d",
".git/objects/e5/25507790ffde3bcd0d4a7b21f461791cb62eb2": "efe6277330c122c3e1797551d4c3444c",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/18555821f6fbf04e8979d74f07a662f3a92bfb": "65df605bdf3769013eb0fc7bcab080a4",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f3/facf9c56418edea7f4d72d89aa5dca52e99531": "732e54b98b4d1d4dbb90ae2f3945049a",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/fb/53d97ebf324815a3b041eda105ae027d06e043": "650b5db79ef45c3a61a2ca3b93b31b50",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/refs/heads/main": "15ed9c9dad447dafa4e28dedbbb8c89a",
"assets/AssetManifest.bin": "b61b1cc4ea9497511ff50b132b7e1952",
"assets/AssetManifest.bin.json": "b2a992a62b3de122327661b7d91b036b",
"assets/AssetManifest.json": "425929bee8bda0bb5ba8a51799ee0350",
"assets/assets/backgrounds/about_us_bg.jpeg": "8bb410bb363bf387023ebf9c338864d8",
"assets/assets/backgrounds/home_screen_bg.jpeg": "a4b8be641787544059f0971afdedfaf4",
"assets/assets/backgrounds/register_bg.jpeg": "6b4ca96c94f858b1b827d4983900d064",
"assets/assets/icons/app_icon.png": "8857901dfdb8d60e2236af05705108fd",
"assets/assets/icons/instagram.png": "4bdf479eca9cd1581bce32d8169f19bd",
"assets/assets/icons/whatsapp.png": "3cd5c203b33763c467e0d5401de0846a",
"assets/assets/images/art_01.png": "224942223b40ab675fda03efd89c3aa9",
"assets/assets/images/art_02.png": "ec9713166e0242b310747874a1133ded",
"assets/assets/images/art_03.png": "7f4b558e0e93744ad2433db2becd7e0e",
"assets/assets/images/art_04.png": "8abb441e20faaf9af3957eeadf428ed4",
"assets/assets/images/art_05.png": "d1c9f35646c958ff830b95cf8b18116c",
"assets/assets/images/art_06.png": "aec7a6326276663d7633156961e22dbe",
"assets/assets/images/art_07.png": "ca63647ae7ffe93cbfc5286eee0b4bb6",
"assets/assets/images/art_08.png": "7b9076102c7a4082ef26c281289bceea",
"assets/assets/images/art_09.png": "fe6a22cb026376e157e566d0f1a33e69",
"assets/assets/images/art_10.png": "b64cfb7ba30131d0aee00650410834c4",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "38afa7d1bd7514e87cee434c071b1ac6",
"assets/NOTICES": "1eceb2a344dd34f1d67257fd5c85d6ca",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "f5351e9d40cbb801c3f0d1c87fe01c06",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "dbb19e84266527dba81072d4c53d8453",
"/": "dbb19e84266527dba81072d4c53d8453",
"main.dart.js": "6daad72e807d2708106589f6e86ab197",
"manifest.json": "0413faa59ef7a9a0304d4ef87a719891",
"version.json": "2bb72406ec82db0134af412593e01664"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
