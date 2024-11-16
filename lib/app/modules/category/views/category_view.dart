import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/text_utils.dart';
import '../../../../components/widgets/category/category_widget.dart';
import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.only(left: 15,top: 15),
        child: Column(
        children: [
           Align(
             alignment: Alignment.topLeft,
             child: Padding(
               padding: const EdgeInsets.only(left: 15,top: 15),
               child: TextUtils(
                 color: Get.isDarkMode?Colors.white:Colors.black,
               fontSize: 30,
               fontWeight: FontWeight.bold,
               text: "Category".tr,
               underline: TextDecoration.none,)
             ),
           ),
          const SizedBox(
            height: 20,
          ),
          CategoryWidget()
      ],
    )
    );
}}
