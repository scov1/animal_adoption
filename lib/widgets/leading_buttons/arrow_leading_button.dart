import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';
import '../../gen/assets.gen.dart';

class ArrowLeadingButton extends StatelessWidget {
  const ArrowLeadingButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Center(
        child: SvgPicture.asset(
          Assets.svg.arrowBack,
          width: 20,
        ),
      ),
      color: context.color.textPrimary,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        FocusScope.of(context).unfocus();
        onPressed?.call();
        if (onPressed == null) {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
