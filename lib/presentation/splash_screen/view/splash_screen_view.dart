import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff2f335b), Color(0xff3f2b7e)],
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x19000000),
                      blurRadius: 24,
                      offset: Offset(0, 11),
                    ),
                  ],
                ),
                child:
                    Image.asset(
                          "assets/house.png",
                          width: MediaQuery.of(context).size.width > 350
                              ? 350
                              : MediaQuery.of(context).size.width / 1.4,
                          height: MediaQuery.of(context).size.height / 2.5,
                          fit: BoxFit.fill,
                        )
                        .animate()
                        .fadeIn(duration: 2500.ms)
                        .shimmer(duration: 3000.ms)
                        .saturate(duration: 800.ms),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
