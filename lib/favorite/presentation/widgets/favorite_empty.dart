import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../root/controller/primary_tab_controller.dart';

class EmptyFavorite extends StatelessWidget {
  const EmptyFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              Assets.svg.icEmptyFavorite,
              height: 280,
              width: 250,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).nobodyAdded,
            style: context.text.h20w700,
          ),
          const SizedBox(height: 24),
          Text(
            S.of(context).tapOnThePlus,
            style: context.text.s14w400.copyWith(color: context.color.grey700),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<PrimaryTabsController>().switchToTab(1);
            },
            child: Text(
              S.of(context).choose,
            ),
            style: context.button.elevated1,
          ),
        ],
      ),
    );
  }
}
