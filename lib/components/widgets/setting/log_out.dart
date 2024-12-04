import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:shop_store/app/modules/login/controllers/login_controller.dart';
import 'package:shop_store/app/modules/settings/controllers/settings_controller.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

import '../../theme_controller.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.defaultDialog(
          title: "Log out From App",
          titleStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          middleText: "Are you sure you need to log out?",
          middleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          backgroundColor: Colors.grey,
          radius: 10,
          textCancel: "No",
          cancelTextColor: Colors.white,
          textConfirm: "Yes",
          confirmTextColor: Colors.white,
          onCancel: () {
            Get.back();
          },
          onConfirm: () {
            controller.signOut();
          },
        );
      },
      splashColor: mainColor,
      borderRadius: BorderRadius.circular(12),
      customBorder: const StadiumBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
        ],
      ),
    );
  }
}

Widget buildIconWidget() {
  return Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: logOutSettings,
          ),
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtils(
          text: "Logout".tr,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode ? Colors.white: Colors.black,
          underline: TextDecoration.none,
        ),
      ],
    ),
  );
}
