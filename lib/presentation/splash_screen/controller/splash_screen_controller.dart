import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  Future<void> initializeData() async {
    await Future.delayed(Duration(milliseconds: 3500), () {
      Get.offAll(LoginView());
    });
  }
}
