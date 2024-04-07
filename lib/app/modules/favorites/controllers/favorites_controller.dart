// import 'package:get/get.dart';
// import 'package:shop_store/app/data/models/product_models.dart';
// import 'package:shop_store/app/data/services/product_service.dart';
//
// class FavoritesController extends GetxController {
//   //TODO: Implement ProductController
//   var productList=<ProductModels>[].obs;
//   var favouriteList=<ProductModels>[].obs;
//   var isLoading=true.obs;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     getProducts();
//
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
//
//   void getProducts() async{
//     var products =  await ProductServices.getProduct();
//     try {
//       isLoading.value=true;
//       if(products.isNotEmpty){
//         productList.addAll(products);
//       }
//     }finally{
//       isLoading.value=false;
//     }
//   }
//   void manageFavourites(int productId){
//
//     favouriteList.add(productList.firstWhere((element) => element.id==productId));
//   }
//   bool isFavourites(int productId){
//     return favouriteList.any((element) => element.id==productId);
//   }
//
// }
//
