import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

import '../../app/modules/mainscreen/views/mainscreen_view.dart';
import '../../app/routes/app_pages.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 150,
          ),
          const SizedBox(
            height: 20, // Ajout d'une hauteur spécifique au SizedBox
          ),
          RichText(
            text: TextSpan(
              text: "Your Cart is ",
              style: TextStyle(
                fontSize: 30,
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: "Empty",
                  style: TextStyle(
                    color: Get.isDarkMode?pinkClr: mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
         TextUtils(text: "Add  items to get Started ",
             fontSize: 15,
             fontWeight: FontWeight.bold,
             color:Get.isDarkMode? Colors.white:Colors.black ,
             underline: TextDecoration.none),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(onPressed: ()
            {Get.to(MainscreenView);},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  primary: Get.isDarkMode?pinkClr:mainColor
                ),


                child: Text("Go to Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),



            ),
          )
        ],
      ),
    );
  }
}
