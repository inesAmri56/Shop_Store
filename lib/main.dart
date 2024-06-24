

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_store/components/theme.dart';
import 'package:shop_store/components/theme_controller.dart';
import 'app/routes/app_pages.dart';

void main()async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "My Application",
debugShowCheckedModeBanner: false,
      theme: ThemesApp.light,
      darkTheme: ThemesApp.light,
      //themeMode: ThemeController().ThemeDataGet,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
