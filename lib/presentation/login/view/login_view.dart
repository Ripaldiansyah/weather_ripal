import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';
import 'package:weather_ripaldiansyah/presentation/login/widget/field_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.none,
                  ),
                ),
              ),
              if (controller.isBlur.value)
                Positioned.fill(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      top: MediaQuery.of(context).size.height / 1.6,

                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 35, sigmaY: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.4, color: Colors.white),
                            ),

                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                primaryColor,
                                primaryColor.withAlpha(160),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                              right: 20.0,
                              left: 20.0,
                            ),
                            child: FieldLogin(),
                          ),
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(duration: 800.ms)
                    .slide(
                      begin: Offset(0, -1),
                      end: Offset.zero,
                      duration: 500.ms,
                      curve: Curves.easeOut,
                    ),
            ],
          ),
        ),
      );
    });
  }
}
