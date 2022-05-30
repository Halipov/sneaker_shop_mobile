import 'package:dio/dio.dart';

import '../../../constants/url_config.dart';
import '../../order/model/order_mode.dart';

class OrdersService {
  final Dio dio;

  OrdersService(this.dio);

  Future<List<Order>> fetchOrders() async {
    // await Future.delayed(
    //   const Duration(milliseconds: 1000),
    // );
    // return HardCodeConstants().productList;
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/orders';
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
      return List<Order>.from(
        response.data.map(
          (x) => Order.fromMap(x),
        ),
      );
    } on DioError {
      rethrow;
    }
  }
}
