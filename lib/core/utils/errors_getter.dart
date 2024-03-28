import 'package:dio/dio.dart';

import '../../../l10n/generated/l10n.dart';
import 'app_exception.dart';

String errorToString(Object? error) => errorToStringList(error).first;

List<String> errorToStringList(Object? error) {
  if (error is AppException) {
    var output = error.messages;
    if (output.isEmpty) {
      output = [S.current.somethingWentWrong];
    }
    return output;
  }

  if (error is DioException) {
    final e = AppException.fromJson(error.response?.data);

    if (e.messages.isEmpty) return [S.current.somethingWentWrong];

    return e.messages;
  }
  return [S.current.somethingWentWrong];
}
