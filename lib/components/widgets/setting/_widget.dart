import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/settings/controllers/settings_controller.dart';
import 'package:shop_store/components/text_utils.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});
SettingsController controller= Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/imageines.jpg'),
              fit: BoxFit.cover

            )
          ),

        ),
        SizedBox(
          width: 18,
        ),
        TextUtils(text:controller.captilize("inesamri").tr , fontSize: 22,
            fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.black,
            underline: TextDecoration.none),
        TextUtils(text: "inesamri@gmail.com", fontSize: 14,
            fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.black,
            underline: TextDecoration.none),

      ],
    );
  }
}
