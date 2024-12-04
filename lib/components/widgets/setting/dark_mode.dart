import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_store/app/modules/settings/controllers/settings_controller.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

import '../../theme_controller.dart';


class DarkModeWidget extends StatelessWidget {
   DarkModeWidget({super.key});
  SettingsController settingController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildIconWidget(),
        Switch(
            activeColor: mainColor,
            value:settingController.switchValue.value,
            onChanged:(value){
              ThemeController().changesThemeMode();
              settingController.switchValue.value =value;
            }),
      ],
    ));
  }
}
Widget buildIconWidget(){
return Material(
  color: Colors.transparent,
  child: Row(
    children: [
      Container(
        padding: const EdgeInsets.all(6),
        decoration:const  BoxDecoration(
          shape: BoxShape.circle,
          color: darkSettings,
        ),
        child:const  Icon(
          Icons.dark_mode,
          color: Colors.white,
        ),
      ),
       const SizedBox(

         width: 20,
      ),
       TextUtils(text: "Dark Mode".tr, fontSize: 22,
          fontWeight: FontWeight.bold,
          color:Get.isDarkMode?Colors.white:Colors.black,
          underline: TextDecoration.none)
    ],
  ),
);


}