import 'package:flutter/material.dart';
import '../../constants/app_styles.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  // final String textValidation;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool enabled;
  final Function()? onTap;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    // required this.textValidation,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.enabled = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            appBoxShadow(offsetY: 0, blurRadius: 2),
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          enabled: enabled,
          textAlign: TextAlign.center,
          style: const TextStyle(fontFamily: 'Expo'),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 0,
                color: Colors.transparent,
              ),
            ),
            hintStyle: getRegularStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
