import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../settings/core_theme.dart';

class ThemeRepo {
  final availableThemes = [
    CoreDefaultTheme(),
  ];
  ValueNotifier<AppTheme> theme = ValueNotifier<AppTheme>(CoreDefaultTheme());
}
