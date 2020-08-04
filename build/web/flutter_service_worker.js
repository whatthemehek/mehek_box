'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "d29c78e31c8f1282c35e8ba4afe76f07",
"assets/assets/sounds/Index10Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index10Length1.wav": "e3876e80d51303ca86beedab3f8ef10b",
"assets/assets/sounds/Index10Length2.wav": "06402c9c967ec183ee951b3786fc8c74",
"assets/assets/sounds/Index10Length3.wav": "024dcd98260d9cc4751ac6264f0fde0c",
"assets/assets/sounds/Index10Length4.wav": "c4a6f3bd2e0195e77f5f38b4191b288e",
"assets/assets/sounds/Index10Length6.wav": "0d76e4e436b4b43a0c2fbac65307964d",
"assets/assets/sounds/Index11Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index11Length1.wav": "7bdbcff632a39166b9fe9d74a788636e",
"assets/assets/sounds/Index11Length2.wav": "42e8f17a8f797493edc44bcc479d60fa",
"assets/assets/sounds/Index11Length3.wav": "a05e66d8ff1c998d9638567727e49645",
"assets/assets/sounds/Index11Length4.wav": "584125ca091d3be316c08ee797719d14",
"assets/assets/sounds/Index11Length6.wav": "6cb646a92523094c596756be14171dda",
"assets/assets/sounds/Index12Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index12Length1.wav": "11247e748acdc0679524b3160b840563",
"assets/assets/sounds/Index12Length2.wav": "29e138b05d825e94cb21b1a09a229d6e",
"assets/assets/sounds/Index12Length3.wav": "a43d31bab7e6ba732333e914b21366ca",
"assets/assets/sounds/Index12Length4.wav": "249220af94595507cf2b8be63ae06b53",
"assets/assets/sounds/Index13Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index13Length1.wav": "12d17bffd3558c90721779474d2db81b",
"assets/assets/sounds/Index13Length2.wav": "746f509a12e5f7f2ece7209e7722f3f9",
"assets/assets/sounds/Index13Length3.wav": "90665e5c989f7e7379e2a7e4d54f3aac",
"assets/assets/sounds/Index13Length4.wav": "4eac2adb92f81fe26c37e268f703fa2c",
"assets/assets/sounds/Index14Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index14Length1.wav": "aa7777a5e53a9514c89a01beedf05a13",
"assets/assets/sounds/Index14Length2.wav": "85f14e073d1698e24709436f91eae42c",
"assets/assets/sounds/Index14Length3.wav": "cdf2a57e901376c7655ac9b90728cabd",
"assets/assets/sounds/Index15Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index15Length1.wav": "51de52e5be0125a54c637a7a736b3055",
"assets/assets/sounds/Index15Length2.wav": "7db7b43cab2c9294dd458e1d0b57dfae",
"assets/assets/sounds/Index16Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index16Length1.wav": "099e44307f3bdf7174b4f44836ecc658",
"assets/assets/sounds/Index1Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index1Length1.wav": "772615684d0f2489bf9166a569356866",
"assets/assets/sounds/Index1Length12.wav": "4887a12550b4952f0f6e189ddbe323c7",
"assets/assets/sounds/Index1Length16.wav": "b119c78b320e927c6f3ffae5a9f30a04",
"assets/assets/sounds/Index1Length2.wav": "39eb8faadc824e8fed8d18866ce1a2d4",
"assets/assets/sounds/Index1Length3.wav": "3999d2770500a785fa6d10e571e16920",
"assets/assets/sounds/Index1Length4.wav": "01ae3bf9420f02a7ae3542ec8d898485",
"assets/assets/sounds/Index1Length6.wav": "1edf1340657f9bdc3d048a1409c3b791",
"assets/assets/sounds/Index1Length8.wav": "23571245b6b38b08e7938f26dade427a",
"assets/assets/sounds/Index2Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index2Length1.wav": "2b209a60499653a81c82b2e34cadee05",
"assets/assets/sounds/Index2Length12.wav": "b77500c1be01fc23fc87df1d02a88584",
"assets/assets/sounds/Index2Length2.wav": "d3b4a0fbcc215c7c9b398b481b646e69",
"assets/assets/sounds/Index2Length3.wav": "9d4681203fa79fda8a799f8abb2274d0",
"assets/assets/sounds/Index2Length4.wav": "9bc307dfc2810972d7fb851780bd4856",
"assets/assets/sounds/Index2Length6.wav": "12256e9827dd704044361b6bea633697",
"assets/assets/sounds/Index2Length8.wav": "236cc6760ff8709f610a5df29f7ee914",
"assets/assets/sounds/Index3Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index3Length1.wav": "25501e35dab4ac090f3d393961c71469",
"assets/assets/sounds/Index3Length12.wav": "6b153fdd906699556ac9c48fe901f824",
"assets/assets/sounds/Index3Length2.wav": "3edf9bea4df56bd4e8298b080258e7ed",
"assets/assets/sounds/Index3Length3.wav": "46134b6c36782d084478b5e9e6b762fe",
"assets/assets/sounds/Index3Length4.wav": "6f107aa30809dc0acc671da9d57e0c98",
"assets/assets/sounds/Index3Length6.wav": "665578c3526000a6bb0979a8b71826af",
"assets/assets/sounds/Index3Length8.wav": "3d806f30a2daba348cc6b946cbcccdf7",
"assets/assets/sounds/Index4Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index4Length1.wav": "3743e7eb1b51781664c79375b942c6da",
"assets/assets/sounds/Index4Length12.wav": "c43ada913dc18cad452a60dd182ed75e",
"assets/assets/sounds/Index4Length2.wav": "6cf0776fffa186c2c2a12558d83768a7",
"assets/assets/sounds/Index4Length3.wav": "f849bddc85b2e7c6fd1f63bcbbd40a6d",
"assets/assets/sounds/Index4Length4.wav": "6b24a2da10a2f1c6a0b04191473341a1",
"assets/assets/sounds/Index4Length6.wav": "c458131ab9551df4f184a25f4e11b263",
"assets/assets/sounds/Index4Length8.wav": "81464c9774dad9c6a3580647ed9d3666",
"assets/assets/sounds/Index5Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index5Length1.wav": "806ab8337ca57173787a4e702a1344ef",
"assets/assets/sounds/Index5Length12.wav": "c1fe4a3b8bc188a2815d18aabb8cef2d",
"assets/assets/sounds/Index5Length2.wav": "87db89ddecceb04ed380c9c0d4ff5859",
"assets/assets/sounds/Index5Length3.wav": "b05ee87ff7b682b9297c55dcb98d93a1",
"assets/assets/sounds/Index5Length4.wav": "3978dc493ca597ce2b1686c187b7de0c",
"assets/assets/sounds/Index5Length6.wav": "94340e0274991073a0cc1edbf4af7a3b",
"assets/assets/sounds/Index5Length8.wav": "4ae7798d014cc138b73f42b33898b042",
"assets/assets/sounds/Index6Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index6Length1.wav": "35f2f15487f285b565a6d84042e0d74f",
"assets/assets/sounds/Index6Length2.wav": "396cfd69805ac29ee24ab5fd58364887",
"assets/assets/sounds/Index6Length3.wav": "4dcac0661072a743e9a60d37be96c83f",
"assets/assets/sounds/Index6Length4.wav": "199f2803267b1bd86cf2aea43bd9e0e9",
"assets/assets/sounds/Index6Length6.wav": "7db149b1a69a631b7ac7d6eada0fe29b",
"assets/assets/sounds/Index6Length8.wav": "3c989280c19fa8396aaf3d5cd400ee52",
"assets/assets/sounds/Index7Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index7Length1.wav": "4ab63c3dcdbf66c8e8684e4571afdb31",
"assets/assets/sounds/Index7Length2.wav": "bda7c70ac50680c753f48c31c94abebd",
"assets/assets/sounds/Index7Length3.wav": "2e5c9f44fd79ead45bed0bf55a3be14d",
"assets/assets/sounds/Index7Length4.wav": "1db2d77c01871ee551dd68f75f66c107",
"assets/assets/sounds/Index7Length6.wav": "e4e82234ff5db0537f85be08df8cac2a",
"assets/assets/sounds/Index7Length8.wav": "5a58689b15708f9b02869612ab96a54b",
"assets/assets/sounds/Index8Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index8Length1.wav": "72aed5bbbe74c1d238c625940216f407",
"assets/assets/sounds/Index8Length2.wav": "8a27589e239f08d83a6eeb4b3a7f02e5",
"assets/assets/sounds/Index8Length3.wav": "fe792670c83be5650b0a692e008c68e9",
"assets/assets/sounds/Index8Length4.wav": "c2c338ea17f946e033e63e740e84853e",
"assets/assets/sounds/Index8Length6.wav": "bf359945806a4c1a1af022d3ab7c8388",
"assets/assets/sounds/Index8Length8.wav": "7685dc4811b1713a82800e28d25e4165",
"assets/assets/sounds/Index9Length0.wav": "959c53595dba4a30fec8715149f2947a",
"assets/assets/sounds/Index9Length1.wav": "ef3438e19d91637ec197ce7a0b5bfd0d",
"assets/assets/sounds/Index9Length2.wav": "0b870a0d1df07e11fc413c41e70b5d53",
"assets/assets/sounds/Index9Length3.wav": "f2cdebe3e1ce45cd4263368a22fe94ec",
"assets/assets/sounds/Index9Length4.wav": "dc5120192375369d8e2e447894b356b1",
"assets/assets/sounds/Index9Length6.wav": "590571d21627f180ab3f970abf145585",
"assets/assets/sounds/Index9Length8.wav": "1d3b950fd37d932669e0dac2054aefc1",
"assets/assets/sounds/metronome.wav": "fe5ef28c9c447aef8116393c4921a937",
"assets/FontManifest.json": "1501f5aabccf7e7490f665fd81c1bb64",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/fonts/Musisync-KVLZ.ttf": "21c3d12f3e3ccbae6bd5441f77538930",
"assets/fonts/Musisync-qYy6.ttf": "7663fd6b156c6882e4b66bd72556e0ee",
"assets/LICENSE": "d9c13e2b24c325c92af913b7a5edd6d4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "d9502075cca6c48207ceb8bc87b323cb",
"/": "d9502075cca6c48207ceb8bc87b323cb",
"main.dart.js": "d90a229e25a7748d142b2bb8a67e0405",
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
