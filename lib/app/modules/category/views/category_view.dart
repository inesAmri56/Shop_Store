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

          CategoryWidget()
      ],
    )
    );
}}
