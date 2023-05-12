import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsManager {
  static bool testMode = true;

  static String get bannerUnitId {
    if (testMode == true) {
      return BannerAd.testAdUnitId;
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-7619570437589605/3878517409';
    } else if (Platform.isIOS) {
      return 'iOS Unit id';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
