import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/category/controllers/category_controller.dart';

import '../../theme.dart';
import '../category_items.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCategoryLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      controller.getAllCategory(controller.categoryNameList[index]);
                      Get.to(() => CategoryItems(categoryTitle: controller.categoryNameList[index],));
                    },
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(18),
                        image: DecorationImage(
                          image: NetworkImage(
                            controller.listImageCatgories[index],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, bottom: 10),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            controller.categoryNameList[index],
                            style: TextStyle(
                              backgroundColor: Colors.black38,
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: controller.categoryNameList.length,
              ),
            );

      }
    });
  }
}
