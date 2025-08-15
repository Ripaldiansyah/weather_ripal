import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';
import 'package:weather_ripaldiansyah/presentation/home_page/widget/forecast_weather.dart';
import 'package:weather_ripaldiansyah/presentation/home_page/widget/weather_information.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());

    return Obx(() {
      return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width > 400
                    ? 400
                    : MediaQuery.of(context).size.width / 1.4,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/house.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Expanded(child: WeatherInformation()),
                  // Spacer(),
                  Stack(
                    children: [
                      Container(
                        height: controller.slider.value,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1.4, color: Colors.white),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff6e3681).withAlpha(250),
                              primaryColor.withAlpha(240),
                            ],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 8),
                          child: DefaultTabController(
                            length: controller.menus.length,
                            initialIndex: controller.selectedMenu.value,
                            child: Scaffold(
                              backgroundColor: Colors.transparent,
                              appBar: TabBar(
                                dividerColor: borderColor,

                                tabs: [
                                  Tab(
                                    icon: Text(
                                      "Hourly Forecast",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xffaca1ba),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    icon: Text(
                                      "Weekly Forecast",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xffaca1ba),
                                      ),
                                    ),
                                  ),
                                ],
                                onTap: (index) {
                                  controller.selectMenu(index);
                                },
                              ),
                              body: ForecastWeather(controller: controller),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -15,
                        left: MediaQuery.of(context).size.width / 2 - 24,
                        child: GestureDetector(
                          onVerticalDragStart: (_) {
                            controller.startDrag();
                          },
                          onVerticalDragUpdate: (details) {
                            controller.updateSliderValue(
                              details.localPosition.dy,
                              MediaQuery.of(context).size.height / 2,
                            );
                          },
                          child: Icon(
                            Icons.horizontal_rule,
                            size: 54.0,
                            color: Color(0xff482760),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
