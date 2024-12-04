import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_store/app/modules/cartScreen/views/cart_screen_view.dart';
import 'package:shop_store/components/theme.dart';

import '../../../data/models/product_models.dart';

class CartScreenController extends GetxController {
  var productsMap ={}.obs;
  void addProductToCart(ProductModels productModels){
    if(productsMap.containsKey(productModels )){
      productsMap[productModels]+=1;
      
    }else{
      productsMap[productModels]=1; //if this map contain productmodels add to this list only one
    }
  }
  void removeFromCart(ProductModels productModels){
    if(productsMap.containsKey(productModels)&&productsMap[productModels]==1){
      productsMap.removeWhere((key, value) => key==productModels);
    }else{
      productsMap[productModels]-=1;
    }

    
  }
  void removeOneProduct(ProductModels productModels){
    productsMap.removeWhere((key, value) => key==productModels);
  }
  void clearAllProducts(){
    Get.defaultDialog(
      title:"Clear Products",
        titleStyle:const TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      middleText: "Are you sure you need clear product",
      middleTextStyle:const  TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: "No",
      cancelTextColor:Colors.white,
      textConfirm: "YES",
      confirmTextColor: Colors.white,
      onCancel: (){
        Get.to(CartScreenView());
      },
      onConfirm:(){ productsMap.clear();
        Get.back();
        },
      buttonColor: mainColor
    );

  }
  get productSubTotal => productsMap.entries.map((e) => e.key.price * e.value).toList();
  get total=> productsMap.entries.map((e) => e.key.price * e.value).toList()
    .reduce((value, element) => value + element).toStringAsFixed(2);
  int quantity(){
    if(productsMap.isEmpty){
      return 0;
    }
   else{ return productsMap.entries.map((e) => e.value).toList().reduce((value, element) => value + element);}
  }

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
