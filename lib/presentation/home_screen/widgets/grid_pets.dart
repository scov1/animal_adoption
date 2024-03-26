import 'package:flutter/material.dart';

import '../../../core/theme/app_theme.dart';
import '../../../l10n/generated/l10n.dart';

class GridPets extends StatelessWidget {
  const GridPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).adoptPets,
              style: context.text.s20w700.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              S.of(context).showAll,
              style: context.text.s16w400,
            ),
          ],
        )
      ],
    );
  }
}
