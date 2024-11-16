import 'package:http/http.dart'as http ;
import 'package:shop_store/app/data/models/category.dart';
import 'package:shop_store/components/auth/mystring.dart';

import '../models/product_models.dart';

class CategoryServices{
  static Future < List<String>> getCategory()async{
    var response =await http.get(Uri.parse('$baseUrl/products/categories'));
    if(response.statusCode==200){
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    }
    else{
      return throw Exception("failed to load product");
    }
  }
}
class AllCategoryServices{
  static Future < List<ProductModels>> getAllCategory(String categoryName)async{
    var response =await http.get(Uri.parse('$baseUrl/products/category/$categoryName'));
    if(response.statusCode==200){
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    }
    else{
      return throw Exception("failed to load product");
    }
  }
}