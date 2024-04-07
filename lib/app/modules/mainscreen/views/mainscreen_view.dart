import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/routes/app_pages.dart';
import 'package:shop_store/components/theme.dart';

import '../controllers/mainscreen_controller.dart';

class MainscreenView extends GetView<MainscreenController> {
  MainscreenView({Key? key}) : super(key: key);
  MainscreenController controller = Get.put(MainscreenController());

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
              IconButton(
                onPressed: () {
                   Get.toNamed(Routes.CART_SCREEN);
                },
                icon: Image.asset('assets/images/shop.png'),
              ),
            ],
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor  ,
            title: Text(controller.title[controller.currentIndex.value],
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),

          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ?  darkGreyClr:Colors.white ,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ?  pinkClr : mainColor ,
                ),
                icon: Icon(
                  Icons.home,
                  color: Get.isDarkMode ?  Colors.white:Colors.black ,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color:  Get.isDarkMode ?  pinkClr : mainColor ,
                ),
                icon: Icon(
                  Icons.category,
                    color: Get.isDarkMode ?  Colors.white:Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                    color:  Get.isDarkMode ?  pinkClr : mainColor
                ),
                icon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ?  Colors.white:Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color:  Get.isDarkMode ?  pinkClr : mainColor,
                ),
                icon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ?  Colors.white:Colors.black,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      }),
    );
  }
}
