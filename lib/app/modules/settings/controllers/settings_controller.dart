import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_store/app/data/language/ar.dart';
import 'package:shop_store/app/data/language/fr.dart';
import 'package:shop_store/components/auth/mystring.dart';

class SettingsController extends GetxController {

final switchValue=false.obs;
var storage=GetStorage();
var langlocale=ene;
  @override
  Future<void> onInit() async {
    super.onInit();
    langlocale =await  getLanguage;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
String captilize( String profileName){
    return profileName.split(" ").map((name) =>name.capitalize ).join(" ");
}
//langauge
void saveLanguage(String lang) async{
    await storage.write("lang",lang );
}
    Future<String>get getLanguage async{
    return storage.read("lang");
    }
void changeLanguage(String typeLang){
    saveLanguage(typeLang);
   if(langlocale==typeLang){
     return;
   }
   if( typeLang==fra){
     langlocale=fra;
     saveLanguage(fra);
   }else if( typeLang==ara){
     langlocale=ara;
     saveLanguage(ara);
   }else{
     langlocale=ene;
     saveLanguage(ene);
   }
    update();
}
}
