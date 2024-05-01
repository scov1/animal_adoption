import 'package:flutter/material.dart';

import '../../../../core/navigator/navigator1_helper.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/generated/l10n.dart';
import '../../../../widgets/custom_web_view.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.images.banner.path,
          fit: BoxFit.cover,
          width: 400,
        ),
        Positioned(
          top: 23,
          left: 15,
          child: Text(
            S.of(context).joinOurAnimal,
            style: context.text.s20w500.copyWith(color: context.color.background),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 15,
          child: ElevatedButton(
            style: context.button.elevated3,
            onPressed: () {
              context.router.use.push(DocumentWebView(
                title: S.of(context).community,
                url: 'https://www.yummypets.com/members',
              ));
            },
            child: Text(
              S.of(context).joinNow,
              style: context.text.h16w700.copyWith(color: context.color.purpleBg),
            ),
          ),
        )
      ],
    );
  }
}
