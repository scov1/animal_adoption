import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

///snack bar for showing errors and other notifications
Future<void> showCustomSnackbar(BuildContext context, String content, {String? errorText}) async {
  await _buildCustomSnackBarWidget(
    context,
    content,
    errorText: errorText,
  ).show(context);
}

Flushbar _buildCustomSnackBarWidget(BuildContext context, String content, {String? errorText}) {
  return Flushbar(
    backgroundColor: Colors.transparent,
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.only(top: 60),
    flushbarPosition: FlushbarPosition.TOP,
    flushbarStyle: FlushbarStyle.FLOATING,
    duration: const Duration(seconds: 10),
    messageText: Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
          color: context.color.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: context.color.error.withOpacity(0.12),
              blurRadius: 12,
              offset: const Offset(0, 0),
              spreadRadius: 2,
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              content,
              style: context.text.s14w700.copyWith(color: context.color.error),
            ),
          ),
          Icon(
            Icons.close,
            size: 26,
            color: context.color.error,
          )
        ],
      ),
    ),
  );
}
