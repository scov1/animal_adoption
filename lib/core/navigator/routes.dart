import 'package:flutter/material.dart';

import '../../presentation/home_screen/home_screen.dart';
import '../../presentation/onboarding_screen/onboarding_screen.dart';

// создан только для цели показать один из способов навигации

class Routes {
  static final Map<String, WidgetBuilder> routes = {
    '/onboarding': (context) => OnboardingScreen(),
    '/home': (context) => HomeScreen(),
  };
}
