import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';
import '../../theme/app_theme.dart';
import '../../theme/repository/theme_repo.dart';
import '../core_di.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      CoreDi.getIt<ThemeRepo>().theme.value.data.appBarTheme.systemOverlayStyle!,
    );

    _navigateToNextScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16, top: 24),
                  child: Center(
                    child: Image.asset(Assets.images.splash.path),
                  ),
                ),
                Text(S.of(context).everyone, style: context.text.s30w900),
                Text(
                  S.of(context).deserves,
                  style: context.text.s30w900.copyWith(color: context.color.orangeText),
                ),
                Text(S.of(context).aFamily, style: context.text.s30w900),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      CoreDi.getIt<ThemeRepo>().theme.value.data.appBarTheme.systemOverlayStyle!,
    );
    super.dispose();
  }

  void _navigateToNextScreen() {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    });
  }
}
