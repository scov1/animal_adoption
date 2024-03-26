import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'interceptors/error_interceptor.dart';

class Gateway {
  Gateway({
    // required String localeCode,
    required String Function() token,
    required this.uri,
    required ValueChanged<DioException> onAuthError,
  }) {
    general = Dio()
      ..options.baseUrl = uri
          .replace(
            path: '',
          )
          .toString()
      ..options.connectTimeout = const Duration(minutes: 2)
      ..options.receiveTimeout = const Duration(minutes: 2)
      ..interceptors.addAll(
        [
          ErrorInterceptor(onAuthError: onAuthError),
        ],
      );
  }

  late final Dio general;
  final Uri uri;
}
