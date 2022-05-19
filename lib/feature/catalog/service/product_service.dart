import 'package:dio/dio.dart';

import '../../../constants/url_config.dart';
import '../../auth/service/user_service.dart';
import '../../favorite/bloc/favorite_bloc.dart';
import '../model/product.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  Future<List<Product>> fetchProducts() async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/product';
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      return List<Product>.from(
        response.data.map(
          (x) => Product.fromMap(x),
        ),
      );
    } on DioError {
      rethrow;
    }
  }

  Future<List<Product>> fetchCart() async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final cartId = UserService().user.userInfo.id;
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/cart/$cartId';
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      return List<Product>.from(
        response.data.map(
          (x) => Product.fromMap(x),
        ),
      );
    } on DioError {
      rethrow;
    }
  }

  Future<List<Product>> fetchFavorite() async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final cartId = UserService().user.userInfo.id;
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/favorites/$cartId';
    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
      return List<Product>.from(
        response.data.map(
          (x) => Product.fromMap(x),
        ),
      );
    } on DioError {
      rethrow;
    }
  }

  Future<void> deleteFromCart(int productId) async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final cartId = UserService().user.userInfo.id;
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/removeCart/$cartId';
    try {
      final response = await dio.delete(
        url,
        data: {'id': productId},
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<void> addCart(
    int cartId,
    int productId,
  ) async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/addCart/$cartId';
    try {
      final response = await dio.put(
        url,
        data: {'id': productId},
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
    } on DioError {
      rethrow;
    }
  }

  Future<void> updateFavorites(
    int productId,
  ) async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final endpoint = UrlConfig.endpoint;
    final cartId = UserService().user.userInfo.id;
    final url = '$endpoint/api/addFavorite/$cartId';
    try {
      final response = await dio.put(
        url,
        data: {'id': productId},
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data);
    } on DioError {
      rethrow;
    }
  }
}
