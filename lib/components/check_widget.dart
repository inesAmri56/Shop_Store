import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/signup/controllers/signup_controller.dart';
import 'package:shop_store/components/text_utils.dart';
import 'package:shop_store/components/theme.dart';

class CheckWidget extends StatelessWidget {
   CheckWidget({Key? key}) : super(key: key);
  final controller =Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(builder:(_){
      return  Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isCheckbox?Get.isDarkMode? Image.asset('assets/images/check.png'):Icon(Icons.done,color: pinkClr,):Container(),
            ),
          ),
          SizedBox(width: 10),
          Row(
            children: [
              TextUtils(
                text: 'I accept',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Get.isDarkMode ? Colors.black : Colors.white,
                underline: TextDecoration.none,
              ),
              TextUtils(
                text: 'terms & conditions',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                underline: TextDecoration.underline,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              ),
            ],
          ),
        ],
      );
    });
  }
}
