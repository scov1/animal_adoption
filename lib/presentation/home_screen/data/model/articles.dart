import 'package:flutter/material.dart';

import '../../../../core/theme/settings/theme_colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../l10n/generated/l10n.dart';

class ArticlesDto {
  ArticlesDto({
    required this.image,
    required this.title,
    required this.desc,
  });
  final String image;
  final String title;
  final String desc;
}

class ArticlesData {
  static final List<ArticlesDto> articles = [
    ArticlesDto(
      image: Assets.svg.icArticle1,
      title: S.current.prepareApartment,
      desc: S.current.howToMakeAppartment,
    ),
    ArticlesDto(
      image: Assets.svg.icArticle2,
      title: S.current.petEssetials,
      desc: S.current.whatShouldYouBuy,
    ),
    ArticlesDto(
      image: Assets.svg.icArticle3,
      title: S.current.choosingPet,
      desc: S.current.whatYouShouldPay,
    ),
  ];
}
