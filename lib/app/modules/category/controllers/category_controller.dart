import 'package:get/get.dart';
import 'package:shop_store/app/data/models/product_models.dart';

import '../../../data/services/category_service.dart';


class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading=false.obs;
  List<String>  listImageCatgories= [
    "https://fakestoreapi.com/img/71kWymZ+c+L._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
    "https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg",

  ];
  var categoryList= <ProductModels>[].obs;
  final isAllCategory=false.obs;


  @override
  void onInit() {
    super.onInit();
    getCategoryName();

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void getCategoryName() async{
    isCategoryLoading(true);
    var categoryName= await CategoryServices.getCategory();
    try {
      if(categoryName.isNotEmpty){
        categoryNameList.addAll(categoryName);
      }
    }finally{
      isCategoryLoading(false);
    }
  }
  void getAllCategory( String nameCategory) async{
    isAllCategory(true);
    var categoryName= await AllCategoryServices.getAllCategory(nameCategory);
    try {
      if(categoryName.isNotEmpty){
        categoryList.value=categoryName;
      }
    }finally{
      isAllCategory(false);
    }
  }


}
