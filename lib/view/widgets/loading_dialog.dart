import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'spinner_widget.dart';

class LoadingDialog {
  dialog() {
    Get.dialog( const SpinnerWidget(color: Colors.white,), barrierDismissible: false);
  }
}
