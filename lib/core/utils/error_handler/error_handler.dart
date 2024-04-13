import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../../l10n/generated/l10n.dart';

class ErrorHandler {
  ErrorHandler();
  late final S _lang;

  void initialize(S lang, s) {
    _lang = lang;
  }

  String handleError(BaseBlocError baseError) {
    final error = baseError.e;

    try {
      if (error is DioException) {
        if (error.type == DioExceptionType.receiveTimeout ||
            error.type == DioExceptionType.connectionTimeout) {
          return _lang.serverIsNotReachable;
        } else if (error.type == DioExceptionType.badResponse) {
          return _lang.problemConnectingToTheServer;
        }
      }
      if (error is PlatformException) {
        return _lang.problemConnectingToTheServer;
      }
    } catch (e) {
      log(e.toString());
    }
    if (error is DioException) {
      if (error.response?.statusCode == 502) {
        return 'Problem with server';
      }
    }
    if (error is DioException) {
      return '${error.response?.statusMessage ?? ''} || ${error.response?.statusCode ?? ''} || ${error.requestOptions.uri}';
    }

    return error.toString();
  }
}

class BaseBlocError {
  BaseBlocError(this.e, this.stackTrace);
  final Object e;
  final StackTrace stackTrace;
}
