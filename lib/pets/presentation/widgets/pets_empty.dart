import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';

class PetsEmpty extends StatelessWidget {
  const PetsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.svg.icEmpty,
          ),
          Text(
            S.of(context).oops,
            style: context.text.h20w700,
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).sorryWeDidntFind,
            style: context.text.s14w400.copyWith(color: context.color.grey700),
          ),
        ],
      ),
    );
  }
}
