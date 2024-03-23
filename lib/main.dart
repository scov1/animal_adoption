import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'core/init/core_di.dart';
import 'core/init/global_keys.dart';
import 'core/init/ui/splash_screen.dart';
import 'core/navigator/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/repository/theme_repo.dart';
import 'core/utils/logger.dart';
import 'l10n/generated/l10n.dart';
import 'l10n/locale_repo.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    CoreDi.register();
    await CoreDi.getIt.allReady();

    runApp(
      ValueListenableBuilder<AppTheme>(
        valueListenable: CoreDi.getIt<ThemeRepo>().theme,
        builder: (context, theme, child) => ValueListenableBuilder<Locale>(
            valueListenable: CoreDi.getIt<LocaleRepo>().locale,
            builder: (context, locale, child) {
              return MaterialApp(
                key: const ValueKey('Main'),
                debugShowCheckedModeBanner: false,
                navigatorKey: GlobalKeys.navigatorKey,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                locale: locale,
                theme: theme.data,
                title: 'Nazvanie',
                routes: Routes.routes,
                home: LoaderOverlay(
                  useDefaultLoading: false,
                  overlayColor: Colors.black,
                  overlayWidgetBuilder: (_) {
                    return const CircularProgressIndicator.adaptive();
                  },
                  child: SplashScreen(),
                ),
              );
            }),
      ),
    );
  }, (error, stack) {
    Log.error(error, stack);
  });
}
