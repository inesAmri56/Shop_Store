import 'package:get/get.dart';
import 'package:shop_store/app/modules/category/views/category_view.dart';
import 'package:shop_store/app/modules/favorites/views/favorites_view.dart';
import 'package:shop_store/app/modules/home/views/home_view.dart';
import 'package:shop_store/app/modules/settings/views/settings_view.dart';

class MainscreenController extends GetxController {
  //TODO: Implement MainscreenController

 RxInt currentIndex=0.obs;
 final tabs = [
HomeView(),
   CategoryView(),
   FavoritesView(),
   SettingsView()

 ].obs;
 final title=[
   "Shop  Store",
   "Categories",
   "favourites",
   "Settings"


 ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
