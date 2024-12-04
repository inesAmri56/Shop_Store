import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

import '../../../../components/widgets/setting/_widget.dart';
import '../../../../components/widgets/setting/dark_mode.dart';
import '../../../../components/widgets/setting/language_widget.dart';
import '../../../../components/widgets/setting/log_out.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImage(),
          const SizedBox(height: 10,),
          Divider(
            color: Get.isDarkMode?Colors.white:Colors.grey,
            thickness: 2,
          ),
         const SizedBox(height: 20,),
          TextUtils(text: "GENERAL".tr, fontSize: 18,
              fontWeight: FontWeight.bold, color: mainColor,
              underline: TextDecoration.none,
          ),
         const SizedBox(height: 20,),
         DarkModeWidget(),
          const SizedBox(height: 20,),
          LanguageWidget(),
          const SizedBox(height: 20,),
          LogOutWidget(),
        ],
      )
    );
  }
}
