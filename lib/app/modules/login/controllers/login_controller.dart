import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  RxString email = "".obs;
  RxString password = "".obs;
  final count = 0.obs;
  bool isVisibility = false;

  final GetStorage _storage = GetStorage();

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

  Future<void> signOut() async {



    Get.offAllNamed('/login');
  }
}
