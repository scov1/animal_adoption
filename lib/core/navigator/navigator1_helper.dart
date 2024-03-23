import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'navigator_transitions.dart';

extension NavigatorUtils on BuildContext {
  NavigatorState get router => Navigator.of(this);
  NavigatorState get rootRouter => Navigator.of(this, rootNavigator: true);
}

extension NavigatorStateUtils on NavigatorState {
  NavigatorHelper get use => NavigatorHelper(this);
}

extension NavigatorStateUtilsNullable on NavigatorState? {
  NavigatorHelper? get use {
    if (this == null) return null;
    return NavigatorHelper(this!);
  }
}

class NavigatorHelper {
  NavigatorHelper(this._nav);

  final NavigatorState _nav;

  Future<T?> push<T>(
    Widget screen, {
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.push<T?>(
      adaptiveRoute(screen, transition, transitionDuration),
    );
  }

  Future<T?> pushOff<T>(
    Widget screen, {
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.pushAndRemoveUntil<T>(
      adaptiveRoute(screen, transition, transitionDuration),
      (route) => false,
    );
  }

  Future<void> pushReplacement(
    Widget screen, {
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.pushReplacement(
      adaptiveRoute(screen, transition, transitionDuration),
    );
  }

  Future<T?> pushAndRemoveUntil<T>(
    Widget screen, {
    required String until,
    TransitionBuilder? transition,
    Duration transitionDuration = const Duration(milliseconds: 300),
  }) {
    return _nav.pushAndRemoveUntil<T?>(
      adaptiveRoute(screen, transition, transitionDuration),
      (route) => route.settings.name == until,
    );
  }

  void popUntil<T>(String until) {
    return _nav.popUntil(
      (route) => route.settings.name == until || route.isFirst,
    );
  }

  static Route<T> adaptiveRoute<T>(
    Widget screen, [
    TransitionBuilder? transition,
    Duration? transitionDuration,
  ]) {
    if (transition != null && transitionDuration != null) {
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => screen,
        transitionDuration: transitionDuration,
        transitionsBuilder: NavigatorTransitions.scale,
        settings: RouteSettings(
          name: screen.runtimeType.toString(),
        ),
      );
    }
    if (kIsWeb || Platform.isIOS) {
      return CupertinoPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(
          name: screen.runtimeType.toString(),
        ),
      );
    } else {
      return MaterialPageRoute(
        builder: (context) => screen,
        settings: RouteSettings(
          name: screen.runtimeType.toString(),
        ),
      );
    }
  }
}

typedef TransitionBuilder = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> reverseAnimation,
  Widget child,
);
