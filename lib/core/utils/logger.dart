import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:stack_trace/stack_trace.dart';

//import 'extensions/int.dart';
import 'text_color.dart';

class Log {
  factory Log() => _instance;

  Log._();

  static final _instance = Log._();

  ///[stackTrace] parameter can be either stackTrace or label
  static void error(
    dynamic error, [
    Object? stackTrace,
    String? label,
  ]) {
    String? label0;
    if (label == null) {
      if (stackTrace is String) label0 = stackTrace;
    } else {
      label0 = ' $label ';
    }
    if (error is DioException) {
      label0 ??= ' network ';
      label0 = TextColor.magenta.backFill(
        TextColor.black(label0),
      );
      final output = TextColor.magenta(
        toJson(error.response?.verbose ?? error.verbose),
      );
      dev.log(
        '$label0 $output',
        error: error,
        name: 'ϟ',
        stackTrace: stackTrace is StackTrace ? Trace.from(stackTrace).terse : null,
      );
    } else if (error is String) {
      if (label0 == null) {
        label0 = '';
      } else {
        label0 = TextColor.backRed(TextColor.black(' $label0 '));
      }
      final output = TextColor.red(error);
      dev.log(
        '$label0 $output',
        stackTrace: stackTrace is StackTrace ? stackTrace : null,
        name: 'ϟ',
      );
    } else {
      if (label0 == null) {
        label0 = '';
      } else {
        label0 = TextColor.backRedBright(TextColor.black(' $label0 '));
      }
      final output = TextColor.red(error);
      dev.log(
        '$label0 $output',
        stackTrace: stackTrace is StackTrace ? stackTrace : null,
        name: 'ϟ',
      );
    }
  }

  static String toJson(Object? data) {
    final encoder = JsonEncoder.withIndent(
      '  ',
      //  (value) => _shortenString(value.toString()),
    );
    return encoder.convert(data);
  }

  static void g(Object? data, {String? label}) {
    _logWithColor(TextColor.green, toJson(data), label);
  }

  static void y(Object? data, {String? label}) {
    _logWithColor(TextColor.yellow, toJson(data), label);
  }

  static void c(Object? data, {String? label}) {
    _logWithColor(TextColor.cyan, toJson(data), label);
  }

  static void r(Object? data, {String? label}) {
    _logWithColor(TextColor.red, toJson(data), label);
  }

  static void w(Object? data, {String? label}) {
    _logWithColor(TextColor.white, toJson(data), label);
  }

  static void m(Object? data, {String? label}) {
    _logWithColor(TextColor.magenta, toJson(data), label);
  }

  static void _logWithColor(TextColor color, String output, String? label) {
    var label0 = label;
    if (label0 == null) {
      label0 = '';
    } else {
      label0 = color.backFill(
        TextColor.black(' $label0 ', bold: true),
      );
    }
    dev.log('$label0 ${color(output)}', name: 'ϟ');
  }
}

extension DioResponseUtils on Response {
  Map<String, dynamic> get verbose {
    var respData = data;
    if (respData is String) {
      final firstChar = respData.substring(0, 1);
      //if not html
      if (firstChar != '<') {
        respData = jsonDecode(respData);
      }
    } else if (data is Uint8List) {
      respData = jsonDecode(
        const Utf8Decoder().convert(data),
      );
    }
    var output = <String, dynamic>{
      'endpoint': '${requestOptions.method} $realUri',
      'headers': requestOptions.headers,
      'statusCode': statusCode,
      'statusMessage': statusMessage,
      if (requestOptions.method != 'get') 'request data': _verboseOptions(requestOptions),
      'response data': _shortenObject(respData),
      if (extra.isNotEmpty) 'extra': _shortenObject(extra),
    };

    return output;
  }
}

extension on DioException {
  Map get verbose {
    return {
      'endpoint': '${requestOptions.method} ${requestOptions.uri}',
      if (requestOptions.method != 'get') 'request data': _verboseOptions(requestOptions),
      'message': message,
    };
  }
}

dynamic _verboseOptions(RequestOptions options) {
  if (options.method == 'get') return null;
  var reqData = options.data;
  if (reqData is String) {
    reqData = jsonDecode(reqData);
  }
  return _shortenObject(reqData);
}

// String _shortenString(String text) {
//   if (text.length < 350) {
//     return text;
//   } else if (text.length >= 350 && text.length < 1024) {
//     return '${text.substring(0, 350)}...';
//   } else {
//     final bytes = utf8.encode(text);
//     return '${text.substring(0, 80)}... ${bytes.length.toKb} Kb';
//   }
// }

dynamic _shortenObject(dynamic object) {
  if (object is String) {
    return object;
    //_shortenString(object);
  } else if (object is Map) {
    return object.map((key, value) => MapEntry(key, _shortenObject(value)));
  } else if (object is List) {
    return object.map((e) => _shortenObject(e)).toList();
  } else {
    return object;
  }
}
