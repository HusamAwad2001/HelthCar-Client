import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EmptyList extends StatelessWidget {
  final String? text;
  final double? value;
  const EmptyList({Key? key, this.text, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 200,
            height: 200,
            child: Lottie.asset(
              'assets/json/not-found.json',
              width: Get.width * 5,
            ),
          ),
        ),
        Text(
          text ?? 'لا يوجد عناوين\n قم بإضافة عناوين جديدة',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Expo',
            fontSize: 16,
          ),
        ),
        SizedBox(height: value ?? 0),
      ],
    );
  }
}
