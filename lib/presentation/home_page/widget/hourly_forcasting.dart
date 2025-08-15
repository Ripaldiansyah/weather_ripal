import 'package:flutter/material.dart';
import 'package:weather_ripaldiansyah/core.dart';

class HourlyForcasting extends StatelessWidget {
  const HourlyForcasting({super.key, required this.controller});

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
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
              bool isActive = index == 1;
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
                  color: isActive
                      ? componentColor
                      : secondaryComponentColor.withAlpha(180),
                  border: Border.all(width: 1.0, color: borderColor),
                  borderRadius: const BorderRadius.all(Radius.circular(99.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (index != 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            controller.parseDateToTime(
                              controller.hourlyWeather.value!.list[index].dtTxt,
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 11.0,
                            ),
                          ),
                          Image.network(
                            "https://openweathermap.org/img/wn/${controller.hourlyWeather.value!.list[index].weather[0].icon}@2x.png",
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "${controller.kelvinToCelsius(controller.hourlyWeather.value!.list[index].main.temp)}°",
                            style: TextStyle(fontSize: 17.0, height: 1.1),
                          ),
                        ],
                      ),
                    if (index == 1)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Now",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 11.0,
                            ),
                          ),
                          Image.network(
                            "https://openweathermap.org/img/wn/${controller.weather.value!.weather[0].icon}@2x.png",
                            width: 60.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "${controller.kelvinToCelsius(controller.weather.value!.main.temp)}°",
                            style: TextStyle(fontSize: 17.0, height: 1.1),
                          ),
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
  }
}
