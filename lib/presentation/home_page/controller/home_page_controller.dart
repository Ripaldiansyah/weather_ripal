import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_ripaldiansyah/models/get_current_weather/get_current_weather.dart';
import 'package:weather_ripaldiansyah/models/get_hourly_forecasting_weather/get_hourly_forecasting_weather.dart';
import 'package:weather_ripaldiansyah/services/current_weatcher_service/current_weatcher_service.dart';
import 'package:weather_ripaldiansyah/services/forecasting_weather_service/forecasting_weather_service.dart';

class HomePageController extends GetxController {
  RxInt selectedMenu = 0.obs;
  // RxInt selectedIndexHourly = 0.obs;
  RxInt previousIndexTemp = 0.obs;
  var weather = Rxn<GetCurrentWeather>();
  var hourlyWeather = Rxn<GetHourlyForecastingWeather>();

  final RxDouble slider = 260.0.obs;
  RxDouble groupAligment = 2.0.obs;
  double startSliderValue = 0;

  final RxList<String> menus = <String>[
    "Hourly Forecast",
    "Weekly Forecast",
  ].obs;

  RxBool isCurrentWeatcherFetching = true.obs;
  // RxBool selectedHourly = false.obs;
  RxBool isHourlyWeatcherFetching = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await getPermission();
  }

  selectMenu(int newIndex) {
    selectedMenu.value = newIndex;
  }

  getPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Layanan lokasi tidak aktif.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Exception('Izin lokasi ditolak oleh pengguna.');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw Exception(
          'Izin lokasi ditolak secara permanen. Pengguna harus mengaktifkan izin secara manual melalui pengaturan perangkat.',
        );
      }
      Map<String, String> currentPosition = await getLocation();
      getCurrentWeather(currentPosition);
      getHourlyForcasting(currentPosition);
    } catch (e) {
      // print(e.toString());
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<Map<String, String>> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );

    Map<String, String> currentPosition = {
      "latitude": position.latitude.toString(),
      "longitude": position.longitude.toString(),
    };
    return currentPosition;
  }

  double kelvinToCelsius(double k) {
    return double.parse((k - 273.15).toStringAsFixed(1));
  }

  Future<void> getCurrentWeather(Map<String, String> currentPosition) async {
    try {
      String longitude = currentPosition["longitude"]!;
      String latitude = currentPosition["latitude"]!;
      GetCurrentWeather currentWeather = await CurrentWeatcherService()
          .getCurrentWeather(lat: latitude, long: longitude);
      weather.value = currentWeather;
      isCurrentWeatcherFetching.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> getHourlyForcasting(Map<String, String> currentPosition) async {
    try {
      String longitude = currentPosition["longitude"]!;
      String latitude = currentPosition["latitude"]!;
      GetHourlyForecastingWeather houryForecasting =
          await ForecastingWeatherService().getHourly(
            lat: latitude,
            long: longitude,
          );
      hourlyWeather.value = houryForecasting;
      isHourlyWeatcherFetching.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void updateSliderValue(double delta, double maxHigh) {
    double newValue = startSliderValue - delta;
    if (maxHigh < 275) {
      slider.value = newValue.clamp(200.0, (maxHigh - 30).clamp(190, 205));
    } else {
      slider.value = newValue.clamp(200.0, (maxHigh - 20).clamp(200, 300));
    }
  }

  void startDrag() {
    startSliderValue = slider.value;
  }

  String parseDateToTime(DateTime date) {
    return DateFormat("h a").format(date);
  }

  String parseDate(DateTime date) {
    return DateFormat("dd MMM yyyy").format(date);
  }
}
