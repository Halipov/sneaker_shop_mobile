import 'package:flutter/widgets.dart';

import 'feature/admin/ui/product_details.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  ProductDetails.routeName: (context) => ProductDetails(),
};
