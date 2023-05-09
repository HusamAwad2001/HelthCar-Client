import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snack {
  show({required bool type, required String message}) {
    Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        borderRadius: 10,
        snackStyle: SnackStyle.GROUNDED,
        messageText: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontFamily: 'Expo'),
        ),
        backgroundColor:
            type ? const Color(0xFF27ae60) : const Color(0xFFc0392b));
  }
}
