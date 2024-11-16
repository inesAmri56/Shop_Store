import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/widgets/product_details/clothes_info.dart';
import 'package:shop_store/components/widgets/product_details/size_list.dart';

import '../../../app/data/models/product_models.dart';
import 'add_cart.dart';
import 'image_sliders.dart';

class ProductDetailsView extends StatelessWidget {
  final ProductModels productModels;

  const ProductDetailsView({required this.productModels,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imageUrl: productModels.image,
              ),
              ClothesInfo(title: productModels.title
                ,productId: productModels.id,rate: productModels.rating.rate,
                description: productModels.description,),
              const SizeList(),
              AddCart(price: productModels.price,
              productModels:productModels,)
            ],
          ),
        ),
      ),
    );
  }
}
