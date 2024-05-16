import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

  static Route<T> adaptiveRoute<T>(
    Widget screen, [
    TransitionBuilder? transition,
    Duration? transitionDuration,
  ]) {
    if (transition != null && transitionDuration != null) {
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => screen,
        transitionDuration: transitionDuration,
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
