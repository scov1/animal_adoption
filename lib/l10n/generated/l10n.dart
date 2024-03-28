// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Everyone deserves a family.`
  String get everyoneDeservesFamiliy {
    return Intl.message(
      'Everyone deserves a family.',
      name: 'everyoneDeservesFamiliy',
      desc: '',
      args: [],
    );
  }

  /// `Personalize your preferences`
  String get personalizeYourPref {
    return Intl.message(
      'Personalize your preferences',
      name: 'personalizeYourPref',
      desc: '',
      args: [],
    );
  }

  /// `Customize your ideal pet by setting species, age, size and temperament`
  String get customizeYourIDeal {
    return Intl.message(
      'Customize your ideal pet by setting species, age, size and temperament',
      name: 'customizeYourIDeal',
      desc: '',
      args: [],
    );
  }

  /// `Discover Tailored Mathes`
  String get discoverTailoredMathes {
    return Intl.message(
      'Discover Tailored Mathes',
      name: 'discoverTailoredMathes',
      desc: '',
      args: [],
    );
  }

  /// `Browse profiles photos, and description to find pets that match your criteria`
  String get browseProfiles {
    return Intl.message(
      'Browse profiles photos, and description to find pets that match your criteria',
      name: 'browseProfiles',
      desc: '',
      args: [],
    );
  }

  /// `Connect and Adopt`
  String get connectAndAdopt {
    return Intl.message(
      'Connect and Adopt',
      name: 'connectAndAdopt',
      desc: '',
      args: [],
    );
  }

  /// `Message shelters and make the decision to adopt your new furry friend`
  String get messageShelters {
    return Intl.message(
      'Message shelters and make the decision to adopt your new furry friend',
      name: 'messageShelters',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Join Now`
  String get joinNow {
    return Intl.message(
      'Join Now',
      name: 'joinNow',
      desc: '',
      args: [],
    );
  }

  /// `Join our animal\nlovers Community`
  String get joinOurAnimal {
    return Intl.message(
      'Join our animal\nlovers Community',
      name: 'joinOurAnimal',
      desc: '',
      args: [],
    );
  }

  /// `Community`
  String get community {
    return Intl.message(
      'Community',
      name: 'community',
      desc: '',
      args: [],
    );
  }

  /// `Adopt pets`
  String get adoptPets {
    return Intl.message(
      'Adopt pets',
      name: 'adoptPets',
      desc: '',
      args: [],
    );
  }

  /// `show all`
  String get showAll {
    return Intl.message(
      'show all',
      name: 'showAll',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message(
      'Retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `Prepare the apartment`
  String get prepareApartment {
    return Intl.message(
      'Prepare the apartment',
      name: 'prepareApartment',
      desc: '',
      args: [],
    );
  }

  /// `How to make your apartment a safe and cozy place for your pet?`
  String get howToMakeAppartment {
    return Intl.message(
      'How to make your apartment a safe and cozy place for your pet?',
      name: 'howToMakeAppartment',
      desc: '',
      args: [],
    );
  }

  /// `Pet Essentials`
  String get petEssetials {
    return Intl.message(
      'Pet Essentials',
      name: 'petEssetials',
      desc: '',
      args: [],
    );
  }

  /// `What should you buy first?`
  String get whatShouldYouBuy {
    return Intl.message(
      'What should you buy first?',
      name: 'whatShouldYouBuy',
      desc: '',
      args: [],
    );
  }

  /// `Choosing a pet`
  String get choosingPet {
    return Intl.message(
      'Choosing a pet',
      name: 'choosingPet',
      desc: '',
      args: [],
    );
  }

  /// `What you should pay attention to when choosing a pet?`
  String get whatYouShouldPay {
    return Intl.message(
      'What you should pay attention to when choosing a pet?',
      name: 'whatYouShouldPay',
      desc: '',
      args: [],
    );
  }

  /// `Articles`
  String get articles {
    return Intl.message(
      'Articles',
      name: 'articles',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
