import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_store/app/data/models/product_models.dart';
import 'package:shop_store/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:shop_store/app/modules/category/controllers/category_controller.dart';
import 'package:shop_store/app/modules/product/controllers/product_controller.dart';

import 'package:shop_store/components/text_utils.dart';
import '../theme.dart';
import '../widgets/product_details/product_details.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;
  CategoryItems({Key? key, required this.categoryTitle}) : super(key: key);
  final ProductController controller = Get.put(ProductController());
  final CartScreenController cartController = Get.put(CartScreenController());
  final CategoryController categoryController=Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle,
        style: TextStyle(
          color: Colors.white
        ),),

        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
      ),
      body: Obx(() {
        if(categoryController.isAllCategory.value){
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode?Colors.pink:mainColor,
            ),
          );
        }else{ return
          GridView.builder(
              itemCount:  categoryController.categoryList.length,

              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {

                return BuildCardItems(
                    image: categoryController.categoryList[index].image,
                    price: categoryController.categoryList[index].price,
                    rate: categoryController.categoryList[index].rating.rate,
                    productId: categoryController.categoryList[index].id,
                    productModels: categoryController.categoryList[index],
                    onTap: () {
                      Get.to(ProductDetailsView(
                          productModels: controller.searchList[index])
                      );
                    }

                );
              }

          );
        }
      })
    );
  }

  Widget BuildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    final ProductController controller = Get.put(ProductController());
    final CartScreenController cartController = Get.put(CartScreenController());

    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
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
              Obx(() =>
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.manageFavourites(productId);
                        },
                        icon: controller.isFavourites(productId)
                            ? Icon(
                          Icons.favorite,
                          color: Colors.red,)
                            : Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    image,
                    fit: BoxFit.fitHeight,
                  ),
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
}
