import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_store/components/cart/cart_product_card.dart';
import 'package:shop_store/components/theme.dart';

import '../../../../components/cart/cart_total.dart';
import '../../../../components/cart/empty_cart.dart';
import '../controllers/cart_screen_controller.dart';

class CartScreenView extends GetView<CartScreenController> {
  CartScreenView({Key? key}) : super(key: key);
  final CartScreenController controller = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Cart Items'.tr),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {
              controller.clearAllProducts();
            },
                icon: const Icon(Icons.backspace))
          ],
        ),
        body: Obx(() {
          if(controller.productsMap.isEmpty){
            return EmptyCart();
          }
          else{
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(itemBuilder: (context, index) {
                      return CartProductCard(
                        index: index,
                        productModels: controller.productsMap.keys
                            .toList()[index],
                        quantity: controller.productsMap.values.toList()[index],
                      );
                    },
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 20,
                        ),
                        itemCount: controller.productsMap.length),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40),
                    child: CartTotal(),)
                ],
              ),
            );
          }
        })
    );
  }
}
