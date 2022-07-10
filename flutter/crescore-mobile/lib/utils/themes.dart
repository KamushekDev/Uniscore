import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_provider/theme_provider.dart';

class Themes {
  static List<AppTheme> all = [
    AppTheme(
      id: "light",
      description: "light theme",
      data: getLightTheme(),
    ),
    AppTheme(
      id: "dark",
      description: "Dark theme",
      data: getDarkTheme(),
    ),
  ];

  static ThemeData getLightTheme() {
    var theme = ThemeData.light();

    return _applyText(theme);
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
