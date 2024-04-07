import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/theme.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({super.key});

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
                image:NetworkImage("https://buffer.com/library/free-images/"),
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
                Text("flutter developer code",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode?Colors.white: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("\$109.99",
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
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.remove_circle)),
                    Text("1",
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode?Colors.white: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.add_circle,
                        color:Get.isDarkMode? Colors.white:Colors.black,)),


                    ],
                ),
                IconButton(onPressed: (){},
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
