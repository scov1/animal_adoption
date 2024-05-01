import '../../../../gen/assets.gen.dart';
import '../../../l10n/generated/l10n.dart';

class BasketVo {
  BasketVo({required this.title, required this.image});

  final String title;
  final String image;
}

class Basket {
  static final List<BasketVo> basket = [
    BasketVo(title: S.current.food, image: Assets.images.icBasket1.path),
    BasketVo(title: S.current.waterBowl, image: Assets.images.icBasket2.path),
    BasketVo(title: S.current.toys, image: Assets.images.icBasket3.path),
    BasketVo(title: S.current.bedding, image: Assets.images.icBasket4.path),
    BasketVo(title: S.current.leashAndCollar, image: Assets.images.icBasket5.path),
    BasketVo(title: S.current.scratchingPost, image: Assets.images.icBasket6.path),
    BasketVo(title: S.current.litterBox, image: Assets.images.icBasket7.path),
    BasketVo(title: S.current.brushAndShampoo, image: Assets.images.shampoo.path),
  ];
}
