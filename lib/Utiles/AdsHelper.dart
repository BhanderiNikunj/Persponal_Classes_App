// class AdsHelper {
//   static AdsHelper adsHelper = AdsHelper._();
//
//   AdsHelper._();
//
//   // ca-app-pub-3940256099942544/6300978111 // Banner
//   // ca-app-pub-1456785417505368/6085175664 // Banner my
//   // ca-app-pub-3940256099942544/1033173712 // Interstitial
//   // ca-app-pub-1456785417505368/6156262196 // Interstitial my
//   // ca-app-pub-3940256099942544/3419835294 // Open Ads
//
//   BannerAd? bannerAd;
//   InterstitialAd? interstitialAd;
//   AppOpenAd? appOpenAd;
//
//   void loadBannerAds() {
//     bannerAd = BannerAd(
//       size: AdSize.banner,
//       adUnitId: "ca-app-pub-1456785417505368/6085175664",
//       listener: BannerAdListener(
//         onAdLoaded: (ad) {
//           bannerAd = ad as BannerAd?;
//         },
//       ),
//       request: AdRequest(),
//     )..load();
//   }
//
//   void loadInterstitialAds() {
//     InterstitialAd.load(
//       adUnitId: "ca-app-pub-1456785417505368/6156262196",
//       request: AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) {
//           interstitialAd = ad;
//         },
//         onAdFailedToLoad: (error) {},
//       ),
//     );
//   }
// }
