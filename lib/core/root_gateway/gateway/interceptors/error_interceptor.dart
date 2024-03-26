import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ErrorInterceptor implements Interceptor {
  ErrorInterceptor({
    required this.onAuthError,
  });

  static const authErrorCodes = [401];

  final ValueChanged<DioException> onAuthError;

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) {
    final isAuthError = authErrorCodes.contains(
      error.response?.statusCode,
    );
    if (isAuthError) {
      onAuthError(error);
    }
    handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // print('🏐 {response.data} : ${response.data}');
    handler.next(response);
  }
}
