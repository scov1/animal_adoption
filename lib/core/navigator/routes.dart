import 'package:flutter/material.dart';

import '../../home/presentation/home_screen.dart';
import '../../onboarding/presentation/onboarding_screen.dart';
import '../../root/root_screen.dart';

// создан только для цели показать один из способов навигации

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/onboarding': (context) => OnboardingScreen(),
    '/home': (context) => HomeScreen(),
    '/root': (context) => RootScreen(),
  };
}
