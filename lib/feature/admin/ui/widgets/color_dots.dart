import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/rounded_icon_btn.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/size_config.dart';
import '../../../catalog/model/product.dart';
import '../../../product/bloc/product_bloc.dart';

class SizesContainers extends StatefulWidget {
  const SizesContainers({
    Key? key,
    required this.sizes,
  }) : super(key: key);

  final List<int> sizes;

  @override
  State<SizesContainers> createState() => _SizesContainersState();
}

class _SizesContainersState extends State<SizesContainers> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
            widget.sizes.length,
            (index) => InkWell(
              onTap: () {
                BlocProvider.of<ProductBloc>(context).size =
                    widget.sizes[index].toDouble();
                setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.only(right: 2),
                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: BlocProvider.of<ProductBloc>(context).size ==
                              widget.sizes[index]
                          ? kPrimaryColor
                          : Colors.transparent),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  widget.sizes[index].toString(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
