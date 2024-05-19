import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Alert {
  static snackbar(String title, String message,
      {Color? colorText, Color? backgroundColor}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: colorText,
      margin: const EdgeInsets.all(10),
    );
  }
}
