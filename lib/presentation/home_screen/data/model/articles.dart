import '../../../../gen/assets.gen.dart';
import '../../../../l10n/generated/l10n.dart';
import 'basket.dart';

class ArticlesDto {
  ArticlesDto({
    required this.image,
    required this.title,
    required this.desc,
    required this.createdAt,
    required this.message,
    this.basket,
  });
  final String image;
  final String title;
  final String desc;
  final DateTime createdAt;
  final String message;
  final List<BasketData>? basket;
}

class ArticlesData {
  static final List<ArticlesDto> articles = [
    ArticlesDto(
      image: Assets.svg.icArticle1,
      title: S.current.prepareApartment,
      desc: S.current.howToMakeAppartment,
      createdAt: DateTime(2023, 2, 19),
      message: S.current.articleOne,
    ),
    ArticlesDto(
      image: Assets.svg.icArticle2,
      title: S.current.petEssetials,
      desc: S.current.whatShouldYouBuy,
      createdAt: DateTime(2024, 1, 11),
      message: S.current.articleTwo,
      basket: Basket.basket,
    ),
    ArticlesDto(
      image: Assets.svg.icArticle3,
      title: S.current.choosingPet,
      desc: S.current.whatYouShouldPay,
      createdAt: DateTime(2021, 7, 2),
      message: S.current.articleThree,
    ),
  ];
}
