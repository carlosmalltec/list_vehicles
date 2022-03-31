import 'package:appvehicles/constants/const_colors.dart';
import 'package:appvehicles/constants/const_drawables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationAlerts {
  ApplicationAlerts._();

  static const TOP = SnackPosition.TOP;
  static const BOTTOM = SnackPosition.BOTTOM;

  static d({required String title, String? body, SnackPosition snackPosition = ApplicationAlerts.BOTTOM, int seconds = 5}) {
    Get.snackbar(
      '',
      '',
      titleText: Text(title.toString(), style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
      messageText: Text(body.toString(), style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
      snackPosition: snackPosition,
      backgroundColor: ConstColors.danger,
      colorText: Colors.white,
      duration: Duration(seconds: seconds),
      borderRadius: 0.0,
      icon: const Icon(ConstDrawables.appIconWarningAmberOutlined, color: Colors.white, size: 35),
    );
  }

  static w({required String title, String? body, SnackPosition snackPosition = ApplicationAlerts.BOTTOM, int seconds = 5}) {
    Get.snackbar(
      '',
      '',
      titleText: Text(title.toString(), style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
      messageText: Text(body.toString(), style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
      snackPosition: snackPosition,
      backgroundColor: ConstColors.orange,
      colorText: Colors.white,
      duration: Duration(seconds: seconds),
      borderRadius: 0.0,
      icon: const Icon(ConstDrawables.appIconWarningAmberOutlined, color: Colors.white, size: 35),
    );
  }

  static s({required String title, String? body, SnackPosition snackPosition = ApplicationAlerts.BOTTOM, int seconds = 5}) {
    Get.snackbar(
      '',
      '',
      titleText: Text(title.toString(), style: GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white)),
      messageText: Text(body.toString(), style: GoogleFonts.openSans(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
      snackPosition: snackPosition,
      backgroundColor: ConstColors.greenDark,
      colorText: Colors.white,
      duration: Duration(seconds: seconds),
      borderRadius: 0.0,
      icon: const Icon(ConstDrawables.appIconWarningAmberOutlined, color: Colors.white, size: 35),
    );
  }
}
