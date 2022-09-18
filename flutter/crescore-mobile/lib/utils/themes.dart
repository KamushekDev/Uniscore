import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

class Themes {
  static String darkId = "dark";
  static String lightId = "light";

  static List<AppTheme> all = [
    AppTheme(
      id: lightId,
      description: "light theme",
      data: getLightTheme(),
    ),
    AppTheme(
      id: darkId,
      description: "Dark theme",
      data: getDarkTheme(),
    ),
  ];

  static ThemeData getLightTheme() {
    var theme = ThemeData.light();

    var colorScheme = theme.colorScheme.copyWith(background: Color.fromARGB(255, 250, 250, 250));
    var coloredTheme = theme.copyWith(colorScheme: colorScheme);

    return _applyText(coloredTheme);
  }

  static ThemeData getDarkTheme() {
    var theme = ThemeData.dark();

    return _applyText(theme);
  }

  static ThemeData _applyText(ThemeData theme) {
    var textTheme = GoogleFonts.manropeTextTheme(theme.textTheme);
    return ThemeData.from(colorScheme: theme.colorScheme, textTheme: textTheme, useMaterial3: true);
  }
}
