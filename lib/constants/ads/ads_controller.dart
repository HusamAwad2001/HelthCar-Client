import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:helth_care_client/constants/ads/ads_manager.dart';

class AdsController extends GetxController {
  // Banner Ad
  late BannerAd _bannerAd;
  bool _adIsLoaded = false;
  var context = BuildContext;

  @override
  void onInit() {
    super.onInit();
    initGoogleAds();
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdsManager.bannerUnitId,
      request: const AdRequest(),
      listener: BannerAdListener(onAdLoaded: (ad) {
        _adIsLoaded = true;
      }, onAdFailedToLoad: (ad, error) {
        _adIsLoaded = false;
      }),
    );
    _bannerAd.load();
  }

  Future<InitializationStatus> initGoogleAds() {
    return MobileAds.instance.initialize();
  }

  Widget bannerAdWidget() {
    if (_adIsLoaded) {
      return Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(5),
        width: _bannerAd.size.width.toDouble(),
        height: _bannerAd.size.height.toDouble(),
        child: AdWidget(ad: _bannerAd),
      );
    } else {
      return const SizedBox();
    }
  }
}
