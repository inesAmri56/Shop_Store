import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:shop_store/app/modules/cartScreen/views/cart_screen_view.dart';
import 'package:shop_store/app/routes/app_pages.dart';
import 'package:shop_store/components/theme.dart';
import 'package:badges/badges.dart' as badges;
import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  MainscreenView({Key? key}) : super(key: key);
  final MainscreenController controller = Get.put(MainscreenController());
  final CartScreenController cartController=Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            actions: [
              Obx(() {
                CartScreenController cartController =Get.put(CartScreenController());
                return badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: Duration(milliseconds: 300),
                  animationType: badges.BadgeAnimationType.slide,
                  badgeContent:  Text(
                    cartController.quantity().toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart), onPressed: () {
                        Get.to(CartScreenView());
                  }),
                );
              }),
            ],
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            title: Text(controller.title[controller.currentIndex.value],
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          bottomNavigationBar: Obx(() =>
              BottomNavigationBar(
                backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
                currentIndex: controller.currentIndex.value,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: '',
                  ),
                ],
                onTap: (index) {
                  controller.currentIndex.value = index;
                },
              )),
          body: Obx(() =>
              IndexedStack(
                index: controller.currentIndex.value,
                children: controller.tabs.value,
              )),
        );
      }),
    );
  }
}
