

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_store/components/auth/mystring.dart';
import 'package:shop_store/components/theme.dart';
import 'package:shop_store/components/theme_controller.dart';
import 'app/data/language/localization.dart';
import 'app/routes/app_pages.dart';

void main()async {
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "My Application",
debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read('lang')?.toString() ?? 'en'),
        translations: LocalizationApp(),
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
       themeMode: ThemeController().ThemeDataGet,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,

    ),
  );
}
