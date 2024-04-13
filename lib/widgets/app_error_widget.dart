import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../core/theme/app_theme.dart';
import '../l10n/generated/l10n.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    this.message,
    this.onRefresh,
  });

  final String? message;
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons_svg/tree.svg'),
          const SizedBox(height: 18),
          Text(message ?? S.of(context).somethingWentWrong),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: context.button.elevated1,
                  onPressed: () => onRefresh?.call(),
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
