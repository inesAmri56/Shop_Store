import 'package:http/http.dart'as http ;
import 'package:shop_store/components/auth/mystring.dart';

import '../models/product_models.dart';
class ProductServices{
 static Future < List<ProductModels>> getProduct()async{
  var response =await http.get(Uri.parse('$baseUrl/products'));
  if(response.statusCode==200){
    var jsonData = response.body;
    return productModelsFromJson(jsonData);
  }
  else{
    return throw Exception("failed to load product");
  }
}
}