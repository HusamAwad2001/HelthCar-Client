import 'package:flutter/material.dart';
import 'package:helth_care_client/constants/constants.dart';

class AppThemes {
  static final ThemeData light = ThemeData(
    useMaterial3: false,
    primarySwatch: MaterialColor(
      primaryCode,
      <int, Color>{
        50: primaryColor.withOpacity(0.1),
        100: primaryColor.withOpacity(0.2),
        200: primaryColor.withOpacity(0.3),
        300: primaryColor.withOpacity(0.4),
        400: primaryColor.withOpacity(0.5),
        500: primaryColor.withOpacity(0.6),
        600: primaryColor.withOpacity(0.7),
        700: primaryColor.withOpacity(0.8),
        800: primaryColor.withOpacity(0.9),
        900: primaryColor.withOpacity(1),
      },
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.white,
  );
}