import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop_store/app/data/models/product_models.dart';
import 'package:shop_store/app/data/services/product_service.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController
var productList=<ProductModels>[].obs;
var favouriteList=<ProductModels>[].obs;
var isLoading=true.obs;
var storage = GetStorage();
//search
  var searchList = <ProductModels>[].obs;
   TextEditingController searchTextController = TextEditingController();



  @override
  void onInit() {
    super.onInit();
    List? storedShoppings=storage.read<List>("isFavouritesList");
    if(storedShoppings!=null){
      favouriteList=storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();

  }

  @override
  void onReady() {
    super.onReady();

  }

  @override
  void onClose() {
    super.onClose();
  }

 void getProducts() async{
 var products =  await ProductServices.getProduct();
 try {
   isLoading.value=true;
   if(products.isNotEmpty){
     productList.addAll(products);
   }
 }finally{
   isLoading.value=false;
 }
 }
void manageFavourites(int productId)async{
  var existingIndex =  favouriteList.indexWhere((element) => element.id==productId);
   if( existingIndex >= 0){
     //pour enregistrer la derniere supression
     await storage.remove("isFavouritesList");
    favouriteList.removeAt(existingIndex);}
   else{
    favouriteList.add(productList.firstWhere((element) => element.id==productId));
    //pour enregistrer la modification
    await storage.write("isFavouritesList", favouriteList);
}}
bool isFavourites(int productId){
return favouriteList.any((element) => element.id==productId);
}
//SearchBar logic
void addSearchToList(String searchName){
    searchName= searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchPrice = search.price.toString().toLowerCase();
     return search.title.toLowerCase().contains(searchName)|| searchPrice.contains(searchName);
    }
    ).toList();
    update();//utilisation de gitBuilder

}
void clearSearch(){
  searchTextController.clear();
  addSearchToList("");
}

}

