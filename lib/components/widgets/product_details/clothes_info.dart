import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import 'package:shop_store/components/text_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop_store/components/theme.dart';
import '../../../app/modules/product/controllers/product_controller.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  IconData? _selectedIcon;
  final String description;

  ClothesInfo({
    Key? key,
    required this.title,
    required this.productId, required this.rate, required this.description
  }) : super(key: key);

  final ProductController controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(() {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: Icon(
                      controller.isFavourites(productId)
                          ? Icons.favorite
                          : Icons.favorite_outline,
                      color: controller.isFavourites(productId)
                          ? Colors.red
                          : Colors.black,
                      size: 26,
                    ),
                  ),
                );
              }),
            ],
          ),
          Row(
            children: [
              TextUtils(text: "$rate", fontSize: 18, fontWeight: FontWeight.bold,
                  color: Get.isDarkMode?Colors.white:Colors.black, underline: TextDecoration.none),
           RatingBar.builder(
             initialRating: rate,
             minRating: 0,
             allowHalfRating: false,
             unratedColor: Colors.grey,
             itemCount: 5,
             itemSize: 20.0,
             itemBuilder: (context, _) => Icon(
               _selectedIcon ?? Icons.star,
               color: Colors.amber,
           ), onRatingUpdate: (double rate) {
               rate = rate;
           },

           )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ReadMoreText(
            description,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show More',
            trimExpandedText: 'Show Less',
            moreStyle:TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?pinkClr:mainColor,
            ) ,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?pinkClr:mainColor,
            ),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?Colors.white:Colors.black,
            ),

          )
        ],
      ),
    );
  }
}


