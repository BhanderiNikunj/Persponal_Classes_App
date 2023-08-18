import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsHelper {
  static AdsHelper adsHelper = AdsHelper._();

  AdsHelper._();

  // ca-app-pub-3940256099942544/6300978111 // Banner
  // ca-app-pub-3940256099942544/1033173712 // Interstitial
  // ca-app-pub-3940256099942544/3419835294 // Open Ads
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  AppOpenAd? appOpenAd;

  void loadBannerAds() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(),
      request: AdRequest(),
    )..load();
  }

  void loadInterstitialAds() {
    InterstitialAd.load(
      adUnitId: "ca-app-pub-3940256099942544/1033173712",
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  void loadOpenAdsAds() {
    AppOpenAd.load(
      adUnitId: "ca-app-pub-3940256099942544/3419835294",
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }
}
