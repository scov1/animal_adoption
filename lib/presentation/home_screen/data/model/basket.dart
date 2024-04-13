import '../../../../gen/assets.gen.dart';

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
