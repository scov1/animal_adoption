import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../l10n/generated/l10n.dart';

@immutable
class AppException extends Equatable implements Exception {
  const AppException(this.messages);

  factory AppException.fromJson(dynamic data) {
    if (data == null) return AppException([S.current.somethingWentWrong]);
    final List errors = _findErrors(data);

    if (data != null) {
      errors.add(data);
    }
    return AppException(
      errors.map((e) => e.toString()).toList(),
    );
  }

  final List<String> messages;

  @override
  List<Object> get props => [messages];

  AppException copyWith({List<String>? messages}) {
    return AppException(messages ?? this.messages);
  }

  static List _findErrors(dynamic data) {
    if (data == null) return [];
    if (data is List) return data;
    if (data is Map) {
      var output = [];
      for (final item in data.values) {
        output.addAll(
          _findErrors(item),
        );
      }
      return output;
    }
    return [data.toString()];
  }
}
