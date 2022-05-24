import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../constants/url_config.dart';
import '../model/order_mode.dart';

class OrderService {
  Future<void> initPaymentSheet(
    Order order,
  ) async {
    // 1. create payment intent on the server
    final check = await Stripe.instance.checkApplePaySupport();
    print(check);
    final data = await _createTestPaymentSheet(order);

    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: data,
        merchantDisplayName: 'Flutter Stripe Store Demo',
        applePay: false,
        googlePay: false,
        testEnv: true,
        merchantCountryCode: 'US',
      ),
    );
    await Stripe.instance.presentPaymentSheet();
    // ignore: avoid_catches_without_on_clauses
  }

  Future<String> _createTestPaymentSheet(
    Order order,
  ) async {
    final dio = Dio();
    final endpoint = UrlConfig.endpoint;
    final url = '$endpoint/api/order';
    final response = await dio.post(
      url,
      data: order.toJson(),
    );
    return response.data['secretKey'];
  }
}
