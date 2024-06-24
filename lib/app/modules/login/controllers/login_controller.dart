import 'package:get/get.dart';

class LoginController extends GetxController {


  RxString email ="".obs;
  RxString password="".obs;
  final count = 0.obs;
  bool isVisibility=false;
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
}
