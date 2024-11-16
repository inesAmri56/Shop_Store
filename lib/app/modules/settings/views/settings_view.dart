import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
         // ProfileImage()
          const SizedBox(height: 10,),
          Divider(
            color: Get.isDarkMode?Colors.white:Colors.grey,
            thickness: 2,
          ),
         const SizedBox(height: 20,),
          TextUtils(text: "GENERAL", fontSize: 18,
              fontWeight: FontWeight.bold, color: mainColor,
              underline: TextDecoration.none,
          ),
         const SizedBox(height: 20,),
         // DarkModeWidget(),
          const SizedBox(height: 20,),
          //LanguageWidget()
          const SizedBox(height: 20,),
          //LogOutWidget()
        ],
      )
    );
  }
}
