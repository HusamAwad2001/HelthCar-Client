import 'package:flutter/material.dart';

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: 'Expo',
      color: color,
      fontWeight: fontWeight);
}

// Light style
TextStyle getLightStyle({double fontSize = 17, Color color = Colors.white}) {
  return _getTextStyle(fontSize, FontWeightManager.light, color);
}

// Regular style
TextStyle getRegularStyle({double fontSize = 17, Color color = Colors.white}) {
  return _getTextStyle(fontSize, FontWeightManager.regular, color);
}

// Medium style
TextStyle getMediumStyle({double fontSize = 17, Color color = Colors.white}) {
  return _getTextStyle(fontSize, FontWeightManager.medium, color);
}

// Semibold style
TextStyle getSemiBoldStyle({double fontSize = 17, Color color = Colors.white}) {
  return _getTextStyle(fontSize, FontWeightManager.semiBold, color);
}

// Bold style
TextStyle getBoldStyle({double fontSize = 17, Color color = Colors.white}) {
  return _getTextStyle(fontSize, FontWeightManager.bold, color);
}

BoxShadow appBoxShadow({
  Color color = Colors.black,
  double blurRadius = 4,
  double offsetX = 0,
  double offsetY = 1,
}) {
  return BoxShadow(
    color: color.withOpacity(.25),
    blurRadius: blurRadius,
    offset: Offset(offsetX, offsetY),
  );
}
