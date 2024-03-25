import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController
RxString name ="".obs;
RxString email ="".obs;
RxString password="".obs;
bool isVisibility = false;
bool isCheckbox=false;





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
void visibility() {
  isVisibility = !isVisibility;
  update();
}
void checkBox(){
    isCheckbox = !isCheckbox;
    update();
}

// Méthode pour inverser l'état de la case à cocher

}


