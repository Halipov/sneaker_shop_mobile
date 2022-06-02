import 'dart:io';

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

  Future<void> deleteProduct(int id) async {
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/product/$id';
    try {
      final response = await dio.delete(
        url,
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

  Future<int> addProduct(
    Product product,
  ) async {
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/product';
    try {
      final response = await dio.post(
        url,
        data: product.toJson(),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data['id']);
      return response.data['id'];
    } on DioError {
      rethrow;
    }
  }

  Future<int> updateProduct(
    Product product,
  ) async {
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/product/${product.id}';
    try {
      final response = await dio.put(
        url,
        data: product.toUpdateJson(),
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
        ),
      );
      print(response.data['id']);
      return response.data['id'];
    } on DioError {
      rethrow;
    }
  }

  Future<void> addPhoto(File photo, int id, bool isFirst) async {
    final fileName = photo.path.split('image_picker').last;
    final endpoint = UrlConfig.endpoint;
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(photo.path, filename: fileName),
    });

    final url = '$endpoint/api/images/upload/$id';
    try {
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      print('Timer1');
      await Future.delayed(
        const Duration(
          seconds: 6,
        ),
      );
      print('TImer2');

      print(response.data);
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
    String article,
    double size,
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
        data: {
          'article': article,
          'size': size,
        },
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

  Future<List<int>> fetchSizes(
    String article,
  ) async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/sizes/$article';
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
      return List<int>.from(
        response.data.map(
          (x) => x.round(),
        ),
      );
    } on DioError {
      rethrow;
    }
  }
}
