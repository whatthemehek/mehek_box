'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "25837185d7d6496dc774661efa5afdc5",
"assets/assets/button-1.mp3": "d25de3d17248bdbe7f6701fd03662860",
"assets/assets/sounds2/Index10Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index10Length1.wav": "3ed475516cbe7a1e0e6f67000a1ab31d",
"assets/assets/sounds2/Index10Length2.wav": "3f2f1c6078aefa34d8779a1892e4db31",
"assets/assets/sounds2/Index10Length3.wav": "0af6988df0c14399a5d88a036bf255f0",
"assets/assets/sounds2/Index10Length4.wav": "9873429f369b62bb2e57e0b7941801d7",
"assets/assets/sounds2/Index10Length6.wav": "77f3b206972a432f8675c04fe70a0a79",
"assets/assets/sounds2/Index11Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index11Length1.wav": "6a501a34fc9a20db6af1c60dbfe4b6fd",
"assets/assets/sounds2/Index11Length2.wav": "e00a3ceb788e173438bb6593ab08ea4a",
"assets/assets/sounds2/Index11Length3.wav": "94329910a697ef57af46cb5f4aa2ca2f",
"assets/assets/sounds2/Index11Length4.wav": "dc9b2560c48d7f2aa2eb0aaee88c063e",
"assets/assets/sounds2/Index11Length6.wav": "1aaa8ccc2109356e8a62a2521e24075f",
"assets/assets/sounds2/Index12Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index12Length1.wav": "e98d96a5fbc51f0b8026d77d074ef401",
"assets/assets/sounds2/Index12Length2.wav": "a5a0eaa1288ee4d5f9de47936f8ff80d",
"assets/assets/sounds2/Index12Length3.wav": "7fe849aa22b2200db6646e44b154e928",
"assets/assets/sounds2/Index12Length4.wav": "7bd44b97a747ec9bded2a3d0fbbf0ea9",
"assets/assets/sounds2/Index13Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index13Length1.wav": "a22d4c47803b9f26b2bf1d9d03bfbe48",
"assets/assets/sounds2/Index13Length2.wav": "eaf805fc203a8ded5bc31839c13eb53f",
"assets/assets/sounds2/Index13Length3.wav": "7130e8d3a501e0dee31a562c85959306",
"assets/assets/sounds2/Index13Length4.wav": "5f00a8f71048fa4df8a5d491561b5f03",
"assets/assets/sounds2/Index14Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index14Length1.wav": "19ae266dfc1f501a506f853a413f241a",
"assets/assets/sounds2/Index14Length2.wav": "ac20b4b6c79eb35ab081d3c8e3641602",
"assets/assets/sounds2/Index14Length3.wav": "b883caa920991085f672ad5c433e1f89",
"assets/assets/sounds2/Index15Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index15Length1.wav": "539dabe671e85b0f779810c8dbc5a984",
"assets/assets/sounds2/Index15Length2.wav": "d98e8ec394fa51d6973654b615f68a37",
"assets/assets/sounds2/Index16Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index16Length1.wav": "79d9e9230e1759a6707b3e682c4f42a1",
"assets/assets/sounds2/Index1Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index1Length1.wav": "6f580834f7f2435b36a9ea8b1fe67612",
"assets/assets/sounds2/Index1Length12.wav": "7bf303fde476426ff999e07c646b9b13",
"assets/assets/sounds2/Index1Length16.wav": "b2b86acbfac53debdb140b123ec43f0c",
"assets/assets/sounds2/Index1Length2.wav": "a6acb5b60ee9f3a39055861357781aac",
"assets/assets/sounds2/Index1Length3.wav": "20cbfb24b625cff6da5d75d8facc64be",
"assets/assets/sounds2/Index1Length4.wav": "0c07a9d22340176e15012b7d4cd8b5ac",
"assets/assets/sounds2/Index1Length6.wav": "b047d6a54f6f21912e45cd49e6775997",
"assets/assets/sounds2/Index1Length8.wav": "3e92bfe08f95695abfdd303cf0264267",
"assets/assets/sounds2/Index2Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index2Length1.wav": "29acd63dcfcc42096be8c9a560411982",
"assets/assets/sounds2/Index2Length12.wav": "4cbf4e2effd4c3107b4f47a3d6965b42",
"assets/assets/sounds2/Index2Length2.wav": "e6fb91ba8222da57cff777b5405ff3ff",
"assets/assets/sounds2/Index2Length3.wav": "54653b791a618df580861bbece5327a6",
"assets/assets/sounds2/Index2Length4.wav": "cd27c17a2ef27be346d5b183a02a90b7",
"assets/assets/sounds2/Index2Length6.wav": "86b6e8db230ec397342661446080bd76",
"assets/assets/sounds2/Index2Length8.wav": "1ea283cd08ac683052995e5f4adf6526",
"assets/assets/sounds2/Index3Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index3Length1.wav": "73ed07573185f288cc921b345196c7f0",
"assets/assets/sounds2/Index3Length12.wav": "3db15d7d02fc3f743ca1ab33d5887d56",
"assets/assets/sounds2/Index3Length2.wav": "11af4f4f0726fdb4ba721edd20644a86",
"assets/assets/sounds2/Index3Length3.wav": "b052e99888b9c6712c4e194baf2dc543",
"assets/assets/sounds2/Index3Length4.wav": "3606689bf2238ae87d5d013f8ac4feec",
"assets/assets/sounds2/Index3Length6.wav": "458266699b5ed5df72c7008f51d53528",
"assets/assets/sounds2/Index3Length8.wav": "d4d527f10deb7b3a1e4b57d47518a3f2",
"assets/assets/sounds2/Index4Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index4Length1.wav": "34d3f79e1f67f240027f2b2ac28a82da",
"assets/assets/sounds2/Index4Length12.wav": "58c0cf8e5d1ddd96f5d1ae976fbdd8f9",
"assets/assets/sounds2/Index4Length2.wav": "5f426e74f4a9760549ef6187162a3c27",
"assets/assets/sounds2/Index4Length3.wav": "b951685fbc175ce0a54a753b28745695",
"assets/assets/sounds2/Index4Length4.wav": "030ced990b929f6064527361aca709b4",
"assets/assets/sounds2/Index4Length6.wav": "12a1ed8d9a5ced564683117c686b8095",
"assets/assets/sounds2/Index4Length8.wav": "44f1e84bd9d6a98acdc0f911d03f290b",
"assets/assets/sounds2/Index5Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index5Length1.wav": "d1505e72b9d83c2fb9194ae56d0c5635",
"assets/assets/sounds2/Index5Length12.wav": "6a4c9eef1502b80b594e14ef961ee939",
"assets/assets/sounds2/Index5Length2.wav": "0a4ea1d9314bb7687f06de6d119b50f2",
"assets/assets/sounds2/Index5Length3.wav": "511706a99df3f16ff02c0ddf9d8ab2ea",
"assets/assets/sounds2/Index5Length4.wav": "8821b4ce38631ee60aabb58f1051dd91",
"assets/assets/sounds2/Index5Length6.wav": "f3ea88cb4f6ab202ea87fca50ba2038f",
"assets/assets/sounds2/Index5Length8.wav": "13c14a0de81f7d763d8367978acb6d56",
"assets/assets/sounds2/Index6Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index6Length1.wav": "39b751999684a55a6811894b690f0594",
"assets/assets/sounds2/Index6Length2.wav": "2149023d9c9a0d9637cb973fd138c978",
"assets/assets/sounds2/Index6Length3.wav": "56cd5765ac8f594f960ac46221b4d66b",
"assets/assets/sounds2/Index6Length4.wav": "9ad822943052e2804b43a38559f05894",
"assets/assets/sounds2/Index6Length6.wav": "719888646a15cc66a1a7c8ec60d545d0",
"assets/assets/sounds2/Index6Length8.wav": "85fd1e342358f8484f598f262e70bbe6",
"assets/assets/sounds2/Index7Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index7Length1.wav": "101131800de400313a318d9155b0f7f3",
"assets/assets/sounds2/Index7Length2.wav": "31645a3850f57521c5d7de7545f56c70",
"assets/assets/sounds2/Index7Length3.wav": "1b34db430f10c42cc8c21ff1395ece39",
"assets/assets/sounds2/Index7Length4.wav": "85bc98c7e66d3f2f749e95cf5044189e",
"assets/assets/sounds2/Index7Length6.wav": "9452b31d60b4487f5d9a6a73c4dfe3bb",
"assets/assets/sounds2/Index7Length8.wav": "419342fb664b53f9728e3c7da3a2f88a",
"assets/assets/sounds2/Index8Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index8Length1.wav": "2da361939213f0c4de002847f215e62e",
"assets/assets/sounds2/Index8Length2.wav": "91f97bde844944ec0ccea898fa0db24b",
"assets/assets/sounds2/Index8Length3.wav": "d927c67e7d5b40623570f13cdb919e7e",
"assets/assets/sounds2/Index8Length4.wav": "c46b81c0425fae723b1dbbc247f87cc9",
"assets/assets/sounds2/Index8Length6.wav": "22c435c434c35f08f5559431c00cb9b3",
"assets/assets/sounds2/Index8Length8.wav": "c7cf137faa1e28f2a92b11b17aa8516c",
"assets/assets/sounds2/Index9Length0.wav": "a08572a85fb267d8e71ca6aa0adbfabd",
"assets/assets/sounds2/Index9Length1.wav": "61b6ee69ddd6f03a1200d73225ee6c20",
"assets/assets/sounds2/Index9Length2.wav": "b683347feb0d4b6ae3c01415e7576c98",
"assets/assets/sounds2/Index9Length3.wav": "0b2c84806a88dd75c692981a8d1b2097",
"assets/assets/sounds2/Index9Length4.wav": "50bbaa62b25490e18100799e39e2954a",
"assets/assets/sounds2/Index9Length6.wav": "a3bd5e0eff62ded684a761aeb27ff115",
"assets/assets/sounds2/Index9Length8.wav": "1e1a7f8b22e37f872193eb6bb7c76d4a",
"assets/assets/sounds2/metronome.mp3": "6f7849267e8fd12056fcc28b2655965b",
"assets/FontManifest.json": "1501f5aabccf7e7490f665fd81c1bb64",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/fonts/Musisync-KVLZ.ttf": "21c3d12f3e3ccbae6bd5441f77538930",
"assets/fonts/Musisync-qYy6.ttf": "7663fd6b156c6882e4b66bd72556e0ee",
"assets/LICENSE": "8da20b59f543ad460cb2d7a11256958a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "d9502075cca6c48207ceb8bc87b323cb",
"/": "d9502075cca6c48207ceb8bc87b323cb",
"main.dart.js": "a2501a799d14d645a74ab74e077c3052",
"manifest.json": "5c363b8fb1aa9ef207b2567ae5540884"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
