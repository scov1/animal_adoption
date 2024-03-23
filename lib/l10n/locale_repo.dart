import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';

class LocaleRepo {
  LocaleRepo() {
    Intl.defaultLocale = 'en';
    locale = ValueNotifier<Locale>(
      _localeFrom(
        Intl.getCurrentLocale(),
      )!,
    );
  }

  late ValueNotifier<Locale> locale;

  Future<bool> apply(String? laguageTag) async {
    final locale = _localeFrom(laguageTag);
    if (locale == null) return false;
    await S.load(locale);
    this.locale.value = locale;
    return true;
  }

  List<Locale> get supportedLocales => S.delegate.supportedLocales;

  static Locale? _localeFrom(String? languageTag) {
    if (languageTag == null || languageTag.isEmpty) return null;
    final tagsList = languageTag.split('_');
    final languageCode = tagsList[0];
    String? scriptCode;
    if (tagsList.length == 3) {
      scriptCode = tagsList[1];
    }
    String? countryCode;
    if (tagsList.length > 1) {
      countryCode = tagsList.last;
    }
    return Locale.fromSubtags(
      languageCode: languageCode,
      scriptCode: scriptCode,
      countryCode: countryCode,
    );
  }
}
