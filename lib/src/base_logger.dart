import 'dart:developer' as dev;

import 'ansi_colors.dart';

abstract class BaseLogger {
  String get name;
  String? get foregroundColor;
  String? get backgroundColor;

  void log(String message) {
    dev.log(
      AnsiColors.fillColor(
        message,
        ansiForegroundColor: foregroundColor,
        ansiBackgroundColor: backgroundColor,
      ),
      name: name,
    );
  }
}
