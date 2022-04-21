import 'package:sneaker_shop/feature/catalog/model/product.dart';

// ignore: avoid_classes_with_only_static_members
class HardCodeConstants {
  List<Product> list = [
    Product(
      id: 1,
      article: '12345',
      name: 'Nike Air Force',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: ['assets/nike-air-force.png'],
    ),
    Product(
      id: 2,
      article: '12346',
      name: 'Nike Air Zoom',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: ['assets/nike-air-zoom.png'],
    ),
    Product(
      id: 3,
      article: '12347',
      name: 'Nike Flywire White',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: ['assets/nike-flywire-nike-white.png'],
    ),
  ];

  List<Product> get productList => list;

  List<Product> addProduct(Product product) {
    list.add(product);
    return list;
  }

  List<Product> updateProduct(Product product) {
    list[list.indexWhere((element) => element.id == product.id)] = product;
    return list;
  }

  List<Product> deleteProduct(Product product) {
    list.removeWhere((element) => element.id == product.id);
    return list;
  }
}
