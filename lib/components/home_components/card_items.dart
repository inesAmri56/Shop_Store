import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/data/models/product_models.dart';
import 'package:shop_store/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:shop_store/app/modules/product/controllers/product_controller.dart';

import 'package:shop_store/components/text_utils.dart';
import '../theme.dart';
import '../widgets/product_details/product_details.dart';

class CardItems extends StatelessWidget {

 final ProductController controller=Get.put(ProductController());
 final CartScreenController cartController= Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ProductController controllerProduct =Get.put(ProductController());
      if (controllerProduct.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
            itemCount: controller.productList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return BuildCardItems(
                image: controller.productList[index].image,
                price: controller.productList[index].price,
                rate: controller.productList[index].rating.rate,
                productId: controller.productList[index].id,
                productModels: controller.productList[index],
                onTap: (){
                  Get.to(ProductDetailsView(productModels:controller.productList[index])
                  );
                }


              );
            },
          ),
        );
      }
    });
  }
}

Widget BuildCardItems({
  required String image,
  required double price,
  required double rate,
  required int productId,
  required ProductModels productModels,
  required Function() onTap,
}) {
  final ProductController controller=Get.put(ProductController());
 final CartScreenController cartController= Get.put(CartScreenController ());

  return Padding(
    padding: const EdgeInsets.all(5),
    child:InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Column(
          children: [
            Obx(()
            => Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    controller.manageFavourites(productId);

                  },
                  icon: controller.isFavourites(productId)
                      ? Icon(
                         Icons.favorite,
                     color : Colors.red,)
                    :Icon(
                        Icons.favorite_outline,
                        color:  Colors.black,
                  ),
                  ),
                IconButton(
                  onPressed: () {
                    cartController.addProductToCart(productModels);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Get.isDarkMode ? mainColor : Colors.black,
                  ),
                ),
              ],
            )),
            //Container de l'image
            Container(
              width: double.infinity,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Image.network(
                image,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 45,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 3, right: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtils(
                            text: "$rate",
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            underline: TextDecoration.none,
                          ),
                          Icon(Icons.star, size: 14, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

