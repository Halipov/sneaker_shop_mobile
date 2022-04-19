import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/catalog_bloc.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CatalogBloc>(context).add(FetchCatalog());
    return BlocBuilder<CatalogBloc, CatalogState>(
      builder: (context, state) {
        if (state is CatalogLoadedState) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return Text(state.products[index].name);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
