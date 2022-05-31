import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../common/default_button.dart';
import '../../../../constants/size_config.dart';
import '../../../auth/ui/widgets/text_field_widget/text_field_input.dart';
import '../../../catalog/model/product.dart';
import '../../bloc/admin_bloc.dart';

// ignore: must_be_immutable
class AddProductScreen extends StatefulWidget {
  Product? product;
  late TextEditingController nameController;
  late TextEditingController articleController;
  late TextEditingController priceController;
  late TextEditingController sizeController;
  late TextEditingController descriptionController;
  AddProductScreen({
    Key? key,
    this.product,
  }) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<XFile>? _imageFileList;
  Future<void> _getFromGallery() async {
    try {
      final _picker = ImagePicker();
      final newFileImages = await _picker.pickMultiImage(
        maxWidth: 1800,
        maxHeight: 1800,
      );
      print(newFileImages);
      setState(() {
        _imageFileList = newFileImages;
      });
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      print(e);
    }
  }

  // void _setImageFileListFromFile(XFile? value) {
  //   _imageFileList = value == null ? null : <XFile>[value];
  // }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget
      ..nameController = TextEditingController()
      ..articleController = TextEditingController()
      ..priceController = TextEditingController()
      ..sizeController = TextEditingController()
      ..descriptionController = TextEditingController();
    final imagesList = _imageFileList == null
        ? [
            InkWell(
              onTap: () async {
                await _getFromGallery();
              },
              child: Container(
                height: 100,
                width: 100,
                child: const Icon(Icons.add),
              ),
            ),
          ]
        // : [
        //     Image.file(File(_imageFileList!.path)),
        //   ];
        : _imageFileList!.isNotEmpty
            ? _imageFileList!.map((element) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      _imageFileList!.remove(element);
                    });
                  },
                  child: Image.file(
                    File(element.path),
                    width: 200,
                    height: 200,
                  ),
                );
              }).toList()
            : [
                InkWell(
                  onTap: () async {
                    await _getFromGallery();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: const Icon(Icons.add),
                  ),
                ),
              ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add product'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: imagesList,
            ),
            TextFieldInput(
              controller: widget.articleController,
              text: 'Article',
              iconName: Icons.title,
              ltext: 'Article',
            ),
            TextFieldInput(
              controller: widget.nameController,
              text: 'Name',
              iconName: Icons.title,
              ltext: 'Name',
            ),
            TextFieldInput(
              controller: widget.descriptionController,
              text: 'Description',
              iconName: Icons.title,
              ltext: 'Description',
            ),
            TextFieldInput(
              controller: widget.priceController,
              text: 'Price',
              iconName: Icons.price_check,
              ltext: 'Price',
            ),
            TextFieldInput(
              controller: widget.sizeController,
              text: 'Size',
              iconName: Icons.line_weight_outlined,
              ltext: 'Size',
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 20,
              ),
              child: BlocBuilder<AdminBloc, AdminState>(
                builder: (context, state) {
                  return DefaultButton(
                    text: state is AdminLoadingState
                        ? 'Adding product'
                        : 'Add product',
                    press: () {
                      BlocProvider.of<AdminBloc>(context).add(
                        AddProduct(
                          Product(
                            photos: [],
                            id: 0,
                            article: widget.articleController.text,
                            name: widget.nameController.text,
                            description: widget.descriptionController.text,
                            price: int.parse(widget.priceController.text),
                            size: 41,
                          ),
                          _imageFileList!,
                          widget.sizeController.text,
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
