

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController{
  final GetStorage boxStorage = GetStorage();
  final key ='isDarkModes';
     saveThemeDataInbox(bool isDark) {
    return boxStorage.write(key, isDark);
  }
  bool getThemeDataFromBox(){
    return boxStorage.read<bool>(key)?? false;
  }

  ThemeMode get ThemeDataGet =>
      getThemeDataFromBox()? ThemeMode.light:ThemeMode.dark;
  void changesThemeMode(){
    Get.changeThemeMode(
        getThemeDataFromBox()? ThemeMode.light: ThemeMode.dark);
    saveThemeDataInbox(!getThemeDataFromBox());
  }


}