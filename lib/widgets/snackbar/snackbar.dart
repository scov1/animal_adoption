import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';

Future<void> showCustomSnackbar(
  BuildContext context,
  String text,
  Color color,
) async {
  await _buildCustomSnackBarWidget(
    context,
    text,
    color,
  ).show(context);
}

Flushbar _buildCustomSnackBarWidget(BuildContext context, String text, color) {
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
              text,
              style: context.text.s14w400.copyWith(color: color),
            ),
          ),
          Icon(
            Icons.close,
            size: 26,
            color: color,
          )
        ],
      ),
    ),
  );
}
