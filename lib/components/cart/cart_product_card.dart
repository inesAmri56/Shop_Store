import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/data/models/product_models.dart';
import 'package:shop_store/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:shop_store/components/theme.dart';

class CartProductCard extends StatelessWidget {
  final  ProductModels productModels;
  final int index;
  final int quantity;
  CartProductCard({
    required this.productModels,
    Key ? key, required this.index, required this.quantity,
  }) :super(key: key);
final CartScreenController controller =Get.put(CartScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20,right: 20,top: 5),
      height: 130,
        width: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode?pinkClr.withOpacity(0.7)
            : mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(
            height: 120,
              width: 100,
              margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color:Colors.white,
              image: DecorationImage(
                image:NetworkImage(productModels.image),
                fit: BoxFit.cover,

                ),

              ),
            ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModels.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode?Colors.white: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text( "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode?Colors.white: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

          ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){
                      controller.removeFromCart(productModels);
                    },
                        icon: Icon(Icons.remove_circle)),
                    Text("$quantity",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode?Colors.white: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){
                      controller.addProductToCart(productModels);

                    },
                        icon: Icon(Icons.add_circle,
                        color:Get.isDarkMode? Colors.white:Colors.black,)),


                    ],
                ),
                IconButton(onPressed: (){
                  controller.removeOneProduct(productModels);
                },
                    icon: Icon(
                      Icons.delete,
                      size: 20,
                      color: Get.isDarkMode?Colors.black:Colors.red,
                    ))

              ],
            ),



        ],
      ),
    );
  }
}
