import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/data/models/product_models.dart';
import 'image_sliders.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModels productModels;

  const ProductDetailsView({required this.productModels,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageSliders(
              imageUrl: productModels.image,
            ),
          ],
        ),
      ),
    );
  }
}
