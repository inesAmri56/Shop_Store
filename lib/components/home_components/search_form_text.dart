import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/product/controllers/product_controller.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({super.key,});

  final ProductController  controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (logic) {
      return Expanded(
        child: TextField(
          controller: controller.searchTextController,
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          onChanged: (searchName) {
            controller.addSearchToList(searchName);
          },
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.red,
            prefixIcon: Icon(Icons.search, color: Colors.grey,
            ),
            suffixIcon:controller.searchTextController.text.isNotEmpty? IconButton(
              onPressed: () {
                controller.clearSearch();
              }, icon: Icon(Icons.close,
              color: Colors.black,),
            ):null,
            hintText: "Search you're Looking for",
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            filled: true,


          ),
        ),
      );
    });
  }
}