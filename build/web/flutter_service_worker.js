'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "7fd2c8485ae4c0402b34b5a39a61876e",
"assets/assets/button-1.mp3": "d25de3d17248bdbe7f6701fd03662860",
"assets/assets/sounds/Index10Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index10Length1.mp3": "7af35df851c800318259936d0a24d6e9",
"assets/assets/sounds/Index10Length2.mp3": "295b4b696a3b64070415381ba85641a5",
"assets/assets/sounds/Index10Length3.mp3": "d598961e68f879e872aca395817b5383",
"assets/assets/sounds/Index10Length4.mp3": "851bb7017f94c1932fc7a244e0edf77c",
"assets/assets/sounds/Index10Length6.mp3": "2ea4ccd055a4f1e12d4d5b081be59b1f",
"assets/assets/sounds/Index11Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index11Length1.mp3": "e2abc4f1461cfe2fd9259b872094787b",
"assets/assets/sounds/Index11Length2.mp3": "b1d399a71044964ea71d8ef05bb5f135",
"assets/assets/sounds/Index11Length3.mp3": "45d3a84ff645a0162b95967cb619a1a5",
"assets/assets/sounds/Index11Length4.mp3": "4523a817b9e8b95a3af72c327b66d421",
"assets/assets/sounds/Index11Length6.mp3": "f124686c227237b73a912453bc7a2e86",
"assets/assets/sounds/Index12Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index12Length1.mp3": "f2149129c7d1b29e635903d70e3d0e5e",
"assets/assets/sounds/Index12Length2.mp3": "7f9ccacb9b2fc0e7f5ffe7eb10b35033",
"assets/assets/sounds/Index12Length3.mp3": "d79bd9188a5b9de9c563651353eabd71",
"assets/assets/sounds/Index12Length4.mp3": "aab1be86bf93c96029cf9af48a1cdc19",
"assets/assets/sounds/Index13Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index13Length1.mp3": "a6d45a2d312174f5b13f91d43a7e52f0",
"assets/assets/sounds/Index13Length2.mp3": "9dcaa030ab4d219133156d491d0b1504",
"assets/assets/sounds/Index13Length3.mp3": "55a24de3312173bc5688a5c5c78e2c8e",
"assets/assets/sounds/Index13Length4.mp3": "c3d743459062347de3de57fe2923afc2",
"assets/assets/sounds/Index14Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index14Length1.mp3": "f419f60b1d3374ef089055df02d09acd",
"assets/assets/sounds/Index14Length2.mp3": "026b3478baf058b9adfd677185334092",
"assets/assets/sounds/Index14Length3.mp3": "909dd429cff884feed9a3b04aff9713e",
"assets/assets/sounds/Index15Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index15Length1.mp3": "a0a6e7b2f08ff7fffe2fa6ac994576c7",
"assets/assets/sounds/Index15Length2.mp3": "38215a26068d945cff6df3faf281fec6",
"assets/assets/sounds/Index16Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index16Length1.mp3": "d8be2519c0a108b021c71befc9ae8cbd",
"assets/assets/sounds/Index1Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index1Length1.mp3": "a266e4fee6f75977a40b57599fe1968e",
"assets/assets/sounds/Index1Length12.mp3": "dc3526c983d8e2d56525c31be7e98a87",
"assets/assets/sounds/Index1Length16.mp3": "67acdb5580587c66b7155e2c5b9d039d",
"assets/assets/sounds/Index1Length2.mp3": "6eeb0ce2172e450d88b19d402e02c1f2",
"assets/assets/sounds/Index1Length3.mp3": "f370f9f0183a07c6cc00e955affbc01e",
"assets/assets/sounds/Index1Length4.mp3": "e5d740719ded61ef28034daa6ed4cd3a",
"assets/assets/sounds/Index1Length6.mp3": "1004361db8c5eeb1b64e3a3d77853ff5",
"assets/assets/sounds/Index1Length8.mp3": "be21e7e6df7ce2eb601274e2468ed897",
"assets/assets/sounds/Index2Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index2Length1.mp3": "b7b56e91ad0a1cb6ec7e63f8756c1b58",
"assets/assets/sounds/Index2Length12.mp3": "bd9ffe62e2b0c7a82f25fa1738828e28",
"assets/assets/sounds/Index2Length2.mp3": "8083762f4e3a9a774dfc6122cff605ee",
"assets/assets/sounds/Index2Length3.mp3": "8a88a6a658bf5b0610f2fadf625dbf00",
"assets/assets/sounds/Index2Length4.mp3": "49b941d0ee678e626f23293dd36c591d",
"assets/assets/sounds/Index2Length6.mp3": "71639c5e02fa08dee40c1ee830f2fb8f",
"assets/assets/sounds/Index2Length8.mp3": "c12df0b31937dd3ecbf3b48193813ab6",
"assets/assets/sounds/Index3Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index3Length1.mp3": "6180f3fef0ef1b6fb5980ac42f51a5d9",
"assets/assets/sounds/Index3Length12.mp3": "c0fa3d5b8c3a4e8e6696093b6b72615f",
"assets/assets/sounds/Index3Length2.mp3": "8a7553895932642e4e174698ec39de4a",
"assets/assets/sounds/Index3Length3.mp3": "4e85fd8a5e08382f732414291a64b07c",
"assets/assets/sounds/Index3Length4.mp3": "c20a33fb6f3a855e3685b8af7ca339e5",
"assets/assets/sounds/Index3Length6.mp3": "278941fc318cc1ef52ccd861defcc1b0",
"assets/assets/sounds/Index3Length8.mp3": "f16cd6015cafef8108d2d772f094c40c",
"assets/assets/sounds/Index4Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index4Length1.mp3": "a95777abf376ff915ebebe8a9c5caf01",
"assets/assets/sounds/Index4Length12.mp3": "9d58fd8071bd7b87f7220eac0d2982c8",
"assets/assets/sounds/Index4Length2.mp3": "a8ae8d049f4fe9afa685c5f6531be708",
"assets/assets/sounds/Index4Length3.mp3": "e285676b3ec5d397fcd9bc930062e633",
"assets/assets/sounds/Index4Length4.mp3": "2ccc787f5b1c580a87755a6b83a93407",
"assets/assets/sounds/Index4Length6.mp3": "078ce83a7da3cd3ea759552f2d142d94",
"assets/assets/sounds/Index4Length8.mp3": "e10053a4a71e351a7dcaa49b031dc214",
"assets/assets/sounds/Index5Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index5Length1.mp3": "83bad692ac5ddd906b63502c03ed8765",
"assets/assets/sounds/Index5Length12.mp3": "efb2f2e163ad1de059f2263fb2f5a724",
"assets/assets/sounds/Index5Length2.mp3": "bd22f3e6b0ae8be0ce5b537f08117f27",
"assets/assets/sounds/Index5Length3.mp3": "f92684cbeac1e5f7ed04453b0443b85f",
"assets/assets/sounds/Index5Length4.mp3": "8a0901954983c41547bb15ee397ca843",
"assets/assets/sounds/Index5Length6.mp3": "f413b3b04528c9fbd365ab7dccc1c69f",
"assets/assets/sounds/Index5Length8.mp3": "3eb76c2842608acbdf079e3f780896c7",
"assets/assets/sounds/Index6Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index6Length1.mp3": "ddd5060fd8ac59f5060dd5ac6dd24610",
"assets/assets/sounds/Index6Length2.mp3": "e682d8c1562a92ef792f17b59b16a022",
"assets/assets/sounds/Index6Length3.mp3": "7ad9596da177702712d0e4f7a0a155a9",
"assets/assets/sounds/Index6Length4.mp3": "5b912e0c972ac0b48d15b6e67eeb1c18",
"assets/assets/sounds/Index6Length6.mp3": "380c0559843a9a4f41f6596d4434d230",
"assets/assets/sounds/Index6Length8.mp3": "44c4cbb16d41e2748fa4f349c7e701e3",
"assets/assets/sounds/Index7Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index7Length1.mp3": "d0ac10e03d16416bef0ca17e8b0c3c5f",
"assets/assets/sounds/Index7Length2.mp3": "576bc90a791cb424a095701429cf2fcc",
"assets/assets/sounds/Index7Length3.mp3": "84962dce46521851cf5f3487f7322052",
"assets/assets/sounds/Index7Length4.mp3": "18a44c9601c1aa7e542efa4f60824172",
"assets/assets/sounds/Index7Length6.mp3": "087c93823954335d0154fae49fa00935",
"assets/assets/sounds/Index7Length8.mp3": "05f2ec2cf16fb7d5500ce5a534130822",
"assets/assets/sounds/Index8Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index8Length1.mp3": "250e96b2cee989543b8eaedb95fa6f86",
"assets/assets/sounds/Index8Length2.mp3": "433bb5949e31ebd0cff0dbb6cde60282",
"assets/assets/sounds/Index8Length3.mp3": "a73bfc080cb8dc2110629f8c4de392d8",
"assets/assets/sounds/Index8Length4.mp3": "c5379ed9a9d94c0c741759931080f6f4",
"assets/assets/sounds/Index8Length6.mp3": "2b7c508190cb4528f9e92d6ed38f8f02",
"assets/assets/sounds/Index8Length8.mp3": "3ec6378b235a60ae7a3a407385ac5372",
"assets/assets/sounds/Index9Length0.mp3": "f6ddca2916e05987f200760a09b4ad1b",
"assets/assets/sounds/Index9Length1.mp3": "ad1e28c2f6401abfcb1abef9a6d3eb19",
"assets/assets/sounds/Index9Length2.mp3": "3b5861ee38f0bdef4bca6ee9ff0a90c4",
"assets/assets/sounds/Index9Length3.mp3": "b9341d73726df8701c694bf14b7f41e6",
"assets/assets/sounds/Index9Length4.mp3": "7be62617dbf8637fe824676fe45c3ae9",
"assets/assets/sounds/Index9Length6.mp3": "aabedeb73074d29ad5980ca7fc5f92f3",
"assets/assets/sounds/Index9Length8.mp3": "b6f16847f3a485528adc3cf31d30d46d",
"assets/assets/sounds/metronome.mp3": "13c198624a06b56879ae0cb3d25cc23c",
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
"main.dart.js": "acefbc2d9fbcec57da099da18c2d0fca",
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
