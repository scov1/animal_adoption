import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/theme/app_theme.dart';
import '../../gen/assets.gen.dart';

class CancelLeadingButton extends StatelessWidget {
  const CancelLeadingButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(Assets.svg.arrowBack),
      color: context.color.textPrimary,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed,
    );
  }
}
