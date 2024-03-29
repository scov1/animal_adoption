import '../../../../gen/assets.gen.dart';
import '../../../../l10n/generated/l10n.dart';

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

class BasketData {
  BasketData({required this.title, required this.image});

  final String title;
  final String image;
}

class Basket {
  static final List<BasketData> basket = [
    BasketData(title: 'Pet food', image: Assets.images.icBasket1.path),
    BasketData(title: 'Food and water bowl', image: Assets.images.icBasket2.path),
    BasketData(title: 'Toys', image: Assets.images.icBasket3.path),
    BasketData(title: 'Bedding', image: Assets.images.icBasket4.path),
    BasketData(title: 'Leash and collar', image: Assets.images.icBasket5.path),
    BasketData(title: 'Scratching post (for cats)', image: Assets.images.icBasket6.path),
    BasketData(title: 'Litter box and litter', image: Assets.images.icBasket7.path),
    BasketData(title: 'Brush and shampoo', image: Assets.images.shampoo.path),
  ];
}
