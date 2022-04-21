import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../constants/products_consants.dart';
import '../../../constants/url_config.dart';
import '../model/product.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  Future<List<Product>> fetchProducts() async {
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    return HardCodeConstants().productList;
    // final endpoint = UrlConfig.endpoint;
    // final url = '$endpoint/api/product';
    // try {
    //   final response = await dio.get(
    //     url,
    //     options: Options(
    //       headers: <String, String>{
    //         'Content-Type': 'application/json',
    //       },
    //     ),
    //   );
    //   print(response.data);
    //   return List<Product>.from(
    //     response.data.map(
    //       (x) => Product.fromMap(x),
    //     ),
    //   );
    // } on DioError {
    //   rethrow;
    // }
  }
}
