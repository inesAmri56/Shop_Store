import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/data/models/product_models.dart';
import 'package:shop_store/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:shop_store/components/theme.dart';

import '../../text_utils.dart';

class AddCart extends StatelessWidget {
   AddCart({super.key, required this.price, required this.productModels});
  final double price;
  final ProductModels productModels;
  final controller =Get.find<CartScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child:
       Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             TextUtils(
               text: 'Price',
               fontSize: 18 ,
               fontWeight: FontWeight.bold,
               color: Colors.grey,
               underline: TextDecoration.none,
             ),
             Text("\$ $price",
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 18,
                 color: Get.isDarkMode?Colors.white:Colors.black,

               ),

             )
           ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              width: 60 ,
              child: ElevatedButton(onPressed: (){
                controller.addProductToCart(productModels);
              },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    elevation: 0,
                    primary: mainColor
                  ),
                  child: const  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     TextUtils(text: "Add To Card", fontSize: 18,
                           fontWeight: FontWeight.w500, color: Colors.white,
                           underline: TextDecoration.none),
                     SizedBox(width: 20,),
                     Icon(Icons.shopping_cart,
                       color: Colors.white,
                     ),

                   ],
                  )),
            ),
          )
        ],
      ),

    );
  }
}
