import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_theme.dart';
import 'theme_button_style.dart';
import 'theme_colors.dart';
import 'theme_text_style.dart';

class CoreDefaultTheme implements AppTheme {
  final ThemeColors _color = const ThemeColors();
  late final ThemeTextStyles _text;

  CoreDefaultTheme() {
    _text = ThemeTextStyles(_color);
  }

  @override
  late final data = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Montserrat',
    useMaterial3: false,
    primaryColor: _color.accent,
    colorScheme: ColorScheme.fromSeed(
      seedColor: _color.accent,
      error: _color.error,
    ),
    hintColor: _color.grey700,
    canvasColor: _color.background,
    textButtonTheme: TextButtonThemeData(
      style: _button.text1,
    ),
    textTheme: TextTheme(
      bodyLarge: _text.s14w400,
      bodyMedium: _text.s14w400,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: _color.accent,
      linearMinHeight: 2.0,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF8FAFB),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFF8FAFB),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
  );

  late final ThemeButtonStyles _button = ThemeButtonStyles(_color, _text);
}
