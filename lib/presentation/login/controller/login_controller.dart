import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/presentation/navigation/view/navigation_view.dart';

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
    await Future.delayed(const Duration(milliseconds: 500));
    isBlur.value = true;
  }

  void redirectToHome() {
    Get.offAll(() => NavigationView());
  }
}
