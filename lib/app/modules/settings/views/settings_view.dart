import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/components/theme_controller.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child:Column(
mainAxisAlignment: MainAxisAlignment.center,     children: [
            TextButton(
              onPressed: (){
                ThemeController().changesThemeMode();

              },
              child: Text(
                "Dark Mode",
                style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),
              ),
            ),
            SizedBox(height:20,),
            TextButton(
              onPressed: (){  },
              child: Text(
                "LogOut",
                style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black),
              ),
            ),          ],
        ),

      ),
    );
  }
}
