import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/product/controllers/product_controller.dart';
import 'package:shop_store/components/text_utils.dart';

class FavoritesView extends GetView<ProductController> {
  FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favouriteList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/heart.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Please Add Your Favorites Products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return buildFavouriteItem(
                image: controller.favouriteList[index].image,
                productId: controller.favouriteList[index].id,
                price: controller.favouriteList[index].price,
                title: controller.favouriteList[index].title,
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                color: Colors.grey,
                thickness: 1,
              );
            },
            itemCount: controller.favouriteList.length,
          );
        }
      }),
    );
  }
}

Widget buildFavouriteItem({
  required String image,
  required int productId,
  required double price,
  required String title,
}) {
  final ProductController controller = Get.find();

  return Padding(
    padding: const EdgeInsets.all(10),
    child: SizedBox(
      width: double.infinity,
      height: 100,
      child: Row(
        children: [
          SizedBox(
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            flex: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  '\$ $price',
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              controller.manageFavourites(productId);
            },
            icon: Icon(
              Icons.favorite,
              color: controller.isFavourites(productId) ? Colors.red : Colors.grey,
              size: 30,
            ),
          )
        ],
      ),
    ),
  );
}
