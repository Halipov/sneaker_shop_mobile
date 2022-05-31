import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin/ui/widgets/body.dart';
import '../../admin/ui/widgets/custom_app_bar.dart';
import '../../catalog/model/product.dart';
import '../../catalog/service/product_service.dart';
import '../bloc/product_bloc.dart';

class ProductDetails extends StatelessWidget {
  final Product product;
  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(
        product,
        context.read<ProductService>(),
      )..add(
          FetchSizes(article: product.article),
        ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F6F9),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(AppBar().preferredSize.height),
          child: CustomAppBar(rating: 5),
        ),
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is ProductAddedToCartState) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const Text(
                    'Added to Cart',
                    textAlign: TextAlign.center,
                  );
                },
              );
            }
            if (state is ErrorState) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const Text(
                    'Error',
                    textAlign: TextAlign.center,
                  );
                },
              );
            }
          },
          builder: (context, state) {
            return Body(
              product: state.product,
              bloc: BlocProvider.of<ProductBloc>(context),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
