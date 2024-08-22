class AnsiColors {
  // Reset
  static const String reset = '\x1B[0m';

  // Regular Colors
  static const String black = '\x1B[30m';
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';
  static const String cyan = '\x1B[36m';
  static const String white = '\x1B[37m';

  // Bright Colors
  static const String brightBlack = '\x1B[90m';
  static const String brightRed = '\x1B[91m';
  static const String brightGreen = '\x1B[92m';
  static const String brightYellow = '\x1B[93m';
  static const String brightBlue = '\x1B[94m';
  static const String brightMagenta = '\x1B[95m';
  static const String brightCyan = '\x1B[96m';
  static const String brightWhite = '\x1B[97m';

  // Background Colors
  static const String bgBlack = '\x1B[40m';
  static const String bgRed = '\x1B[41m';
  static const String bgGreen = '\x1B[42m';
  static const String bgYellow = '\x1B[43m';
  static const String bgBlue = '\x1B[44m';
  static const String bgMagenta = '\x1B[45m';
  static const String bgCyan = '\x1B[46m';
  static const String bgWhite = '\x1B[47m';

  // Bright Background Colors
  static const String bgBrightBlack = '\x1B[100m';
  static const String bgBrightRed = '\x1B[101m';
  static const String bgBrightGreen = '\x1B[102m';
  static const String bgBrightYellow = '\x1B[103m';
  static const String bgBrightBlue = '\x1B[104m';
  static const String bgBrightMagenta = '\x1B[105m';
  static const String bgBrightCyan = '\x1B[106m';
  static const String bgBrightWhite = '\x1B[107m';

  // Underline Colors
  static const String underlineBlack = '\x1B[4;30m';
  static const String underlineRed = '\x1B[4;31m';
  static const String underlineGreen = '\x1B[4;32m';
  static const String underlineYellow = '\x1B[4;33m';
  static const String underlineBlue = '\x1B[4;34m';
  static const String underlineMagenta = '\x1B[4;35m';
  static const String underlineCyan = '\x1B[4;36m';
  static const String underlineWhite = '\x1B[4;37m';

  // Bright Underline Colors
  static const String underlineBrightBlack = '\x1B[4;90m';
  static const String underlineBrightRed = '\x1B[4;91m';
  static const String underlineBrightGreen = '\x1B[4;92m';
  static const String underlineBrightYellow = '\x1B[4;93m';
  static const String underlineBrightBlue = '\x1B[4;94m';
  static const String underlineBrightMagenta = '\x1B[4;95m';
  static const String underlineBrightCyan = '\x1B[4;96m';
  static const String underlineBrightWhite = '\x1B[4;97m';

  // High Intensity Background Colors
  static const String bgHighIntensityBlack = '\x1B[100m';
  static const String bgHighIntensityRed = '\x1B[101m';
  static const String bgHighIntensityGreen = '\x1B[102m';
  static const String bgHighIntensityYellow = '\x1B[103m';
  static const String bgHighIntensityBlue = '\x1B[104m';
  static const String bgHighIntensityMagenta = '\x1B[105m';
  static const String bgHighIntensityCyan = '\x1B[106m';
  static const String bgHighIntensityWhite = '\x1B[107m';

  static String fillColor(
    String message, {
    String? ansiForegroundColor,
    String? ansiBackgroundColor,
  }) {
    final bgColor = ansiBackgroundColor ?? '';
    return '$bgColor$ansiForegroundColor$message${AnsiColors.reset}';
  }
}
