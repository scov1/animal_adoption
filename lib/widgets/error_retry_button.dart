import 'package:flutter/material.dart';

import '../../l10n/generated/l10n.dart';
import '../core/theme/app_theme.dart';

class ErrorRetryButton extends StatelessWidget {
  const ErrorRetryButton({
    required this.errorText,
    required this.onTap,
    super.key,
  });

  final String errorText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            errorText,
            style: context.text.h16w700,
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: context.button.elevated1,
                  onPressed: onTap,
                  child: Text(S.of(context).retry),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
