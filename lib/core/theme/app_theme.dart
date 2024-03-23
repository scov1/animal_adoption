import 'package:flutter/material.dart';

import 'settings/theme_button_style.dart';
import 'settings/theme_colors.dart';
import 'settings/theme_text_style.dart';

abstract class AppTheme {
  abstract final ThemeData data;
}

extension AppThemeUtils on BuildContext {
  ThemeColors get color => Theme.of(this).color;
  ThemeTextStyles get text => Theme.of(this).text;
  ThemeButtonStyles get button => Theme.of(this).button;
  ThemeData get theme => Theme.of(this);
}

extension AppThemeDataUtils on ThemeData {
  ThemeColors get color => ThemeColors();
  ThemeButtonStyles get button => ThemeButtonStyles(ThemeColors(), ThemeTextStyles(ThemeColors()));
  ThemeTextStyles get text => ThemeTextStyles(ThemeColors());
}
