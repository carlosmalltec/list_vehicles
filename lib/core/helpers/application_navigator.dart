import 'package:flutter/material.dart';

class ApplicationNavigator {
  ApplicationNavigator._();

  static open(BuildContext context, Widget widget, {bool fullscreenDialog = false}) {
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (BuildContext context) => widget, fullscreenDialog: fullscreenDialog),
    );
  }
}