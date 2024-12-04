import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_store/app/modules/settings/controllers/settings_controller.dart';
import 'package:shop_store/components/auth/mystring.dart';
import 'package:shop_store/components/theme.dart';

import '../../text_utils.dart';

class LanguageWidget extends StatelessWidget {
   LanguageWidget({super.key});
final SettingsController controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(builder: (_)=>Row(
      mainAxisAlignment:MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration:const  BoxDecoration(
                  shape: BoxShape.circle,
                  color: languageSettings,
                ),
                child:const  Icon(
                  Icons.language,
                  color: Colors.white,
                ),
              ),
              const SizedBox(

                width: 20,
              ),
              TextUtils(text: "Language".tr, fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color:Get.isDarkMode?Colors.white:Colors.black,
                  underline: TextDecoration.none)
            ],
          ),
        ),
        Expanded(
          child: Container(
              width: 100,
              padding: EdgeInsets.symmetric(horizontal: 6,vertical: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Get.isDarkMode?Colors.black:Colors.white,width: 2)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  iconSize: 25,
                  icon:Icon(
                    Icons.arrow_drop_down,
                  ) ,
                  items: [
                    DropdownMenuItem(child: Text(English,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode?Colors.white:Colors.black
                      ),),value: ene,),
                    DropdownMenuItem(child: Text(Arabic,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode?Colors.white:Colors.black
                      ),),value: ara,),
                    DropdownMenuItem(child: Text(Francais,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Get.isDarkMode?Colors.white:Colors.black
                      ),),value: fra,),

                  ], onChanged: (value) {
                   controller.changeLanguage(value!);
                   Get.updateLocale(Locale(value));
                },

                ),
              )
          ),
        ),
      ],
    ));
  }
}
