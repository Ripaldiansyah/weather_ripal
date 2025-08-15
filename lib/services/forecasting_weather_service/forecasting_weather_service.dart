import 'package:dio/dio.dart';
import 'package:weather_ripaldiansyah/models/get_hourly_forecasting_weather/get_hourly_forecasting_weather.dart';

import '../../env.dart';

class ForecastingWeatherService {
  Future<GetHourlyForecastingWeather> getHourly({
    required String lat,
    required String long,
  }) async {
    try {
      var res = await Dio().get(
        "$baseUrl/forecast?lat=$lat&lon=$long&appid=$appId",
      );

      return GetHourlyForecastingWeather.fromJson(res.data);
    } on Exception catch (err) {
      throw Exception(err);
    }
  }
}
