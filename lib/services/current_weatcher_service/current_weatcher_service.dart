import 'package:dio/dio.dart';

import '../../env.dart';
import '../../models/get_current_weather/get_current_weather.dart';

class CurrentWeatcherService {
  Future<GetCurrentWeather> getCurrentWeather({
    required String lat,
    required String long,
  }) async {
    try {
      var res = await Dio().get(
        "$baseUrl/weather?lat=$lat&lon=$long&appid=$appId",
      );

      return GetCurrentWeather.fromJson(res.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
