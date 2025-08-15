import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';

class WeatherInformation extends StatelessWidget {
  const WeatherInformation({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomePageController>();

    return Obx(() {
      if (controller.isCurrentWeatcherFetching.value) {
        return Text(
              "Loading ...",
              style: TextStyle(fontSize: 32.0, color: Colors.grey[400]!),
            )
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 700.ms);
      }

      if (!controller.isCurrentWeatcherFetching.value &&
          controller.weather.value == null) {
        return Column(
          children: [
            Text("Gagal Mendapatkan cuaca", style: TextStyle(fontSize: 22.0)),
          ],
        );
      } else {
        return Column(
          children: [
            Text(
              controller.weather.value!.name,
              style: TextStyle(fontSize: 32.0),
            ),
            Text(
              "${controller.kelvinToCelsius(controller.weather.value!.main.temp)}°",
              style: TextStyle(fontSize: 68.0, height: 1.1),
            ),
            Text(
              controller.weather.value!.weather[0].description,
              style: TextStyle(fontSize: 20.0, color: secondaryTextColor),
            ),
            Text(
              "H:${controller.kelvinToCelsius(controller.weather.value!.main.tempMax)}° L:${controller.kelvinToCelsius(controller.weather.value!.main.tempMin)}°",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        );
      }
    });
  }
}
