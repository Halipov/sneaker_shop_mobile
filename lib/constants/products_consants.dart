import '../common/model/order_model.dart';
import '../feature/catalog/model/product.dart';

// ignore: avoid_classes_with_only_static_members
class HardCodeConstants {
  static HardCodeConstants? _instance;

  HardCodeConstants._();

  factory HardCodeConstants() => _instance ??= HardCodeConstants._();
  bool admin = false;
  List<Product> list = [
    Product(
      id: 1,
      article: '12345',
      name: 'Nike Air Force',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: [],
    ),
    Product(
      id: 2,
      article: '12346',
      name: 'Nike Air Zoom',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: [],
    ),
    Product(
      id: 3,
      article: '12347',
      name: 'Nike Flywire White',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: [],
    ),
    Product(
      id: 4,
      article: '12346',
      name: 'Nike Air Zoom',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: [],
    ),
    Product(
      id: 5,
      article: '12347',
      name: 'Nike Flywire White',
      description: 'Очень удобные кроссовки',
      price: 60,
      size: 41,
      photos: [],
    ),
  ];

  List<OrderModel> orders = [];

  List<Product> favorite = [];

  List<Product> cart = [];
  bool get isAdmin => admin;

  set isAdmin(bool value) => admin = value;

  List<Product> get productList => list;

  List<Product> addProduct(Product product) {
    list.add(product);
    return list;
  }

  List<Product> addProductToCart(Product product) {
    cart.add(product);
    return cart;
  }

  List<Product> deleteProductFromCart(Product product) {
    cart.removeWhere((element) => element.id == product.id);
    return list;
  }

  List<Product> addProductToFavoritre(Product product) {
    favorite.add(product);
    return cart;
  }

  List<Product> deleteProductFromFavorite(Product product) {
    favorite.removeWhere((element) => element.id == product.id);
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
