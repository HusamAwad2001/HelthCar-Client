import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final double width;
  final double height;
  final double fontSize;
  final Color color;
  final double radius;
  final Color textColor;
  final Color borderColor;
  final Color shadowColor;

  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width = 87,
    this.height = 53,
    this.radius = 8,
    this.fontSize = 15,
    this.textColor = Colors.white,
    this.color = primaryColor,
    this.borderColor = Colors.transparent,
    this.shadowColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontFamily: 'Expo',
          ),
        ),
      ),
    );
  }
}
