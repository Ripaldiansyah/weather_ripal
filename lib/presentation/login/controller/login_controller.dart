import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxBool isBlur = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = "".obs;
  final RxInt counter = 0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    isBlur.value = false;
    await Future.delayed(const Duration(seconds: 2));
    isBlur.value = true;
  }
}
