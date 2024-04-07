import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(text: "Total",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  underline: TextDecoration.none
              ),
              Text(
                "\$58055",
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5
                ),
              ),

            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode?pinkClr:mainColor,
    ),
                  onPressed: (){},

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Check Out",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
