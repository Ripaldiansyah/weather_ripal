import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';
import 'package:weather_ripaldiansyah/presentation/home_page/widget/hourly_forcasting.dart';
import 'package:weather_ripaldiansyah/presentation/home_page/widget/weekly_forecasting.dart';

class ForecastWeather extends StatelessWidget {
  const ForecastWeather({super.key, required this.controller});

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isHourlyWeatcherFetching.value) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: SizedBox(
              // margin: EdgeInsets.only(left: 20),
              height: 190,
              child: ListView.builder(
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 70,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 10,
                    ),
                    margin: EdgeInsets.only(
                      right: 10.0,
                      left: index == 0 ? 20 : 0,
                      top: 10,
                      bottom: 20,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(130),

                          blurRadius: 12,
                          offset: Offset(10, 10),
                        ),
                      ],
                      color: secondaryComponentColor.withAlpha(180),
                      border: Border.all(width: 1.0, color: borderColor),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(99.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                  width: 30,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    color: Colors.grey[400]!,
                                  ),
                                )
                                .animate(
                                  onPlay: (controller) => controller.repeat(),
                                )
                                .shimmer(duration: 900.ms),
                            Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 45,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    color: Colors.grey[400]!,
                                  ),
                                )
                                .animate(
                                  onPlay: (controller) => controller.repeat(),
                                )
                                .shimmer(duration: 900.ms),
                            Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: 35,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    color: Colors.grey[400]!,
                                  ),
                                )
                                .animate(
                                  onPlay: (controller) => controller.repeat(),
                                )
                                .shimmer(duration: 900.ms),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      } else if (!controller.isHourlyWeatcherFetching.value &&
          controller.hourlyWeather.value != null) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: IndexedStack(
                index: controller.selectedMenu.value,
                children: [
                  HourlyForcasting(controller: controller),
                  WeeklyForecasting(controller: controller),
                ],
              ),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Text("Gagal Mendapatkan cuaca", style: TextStyle(fontSize: 22.0)),
          ],
        );
      }
    });
  }
}
