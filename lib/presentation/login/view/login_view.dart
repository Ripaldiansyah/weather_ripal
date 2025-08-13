import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';

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
                child: Column(children: [
                          
                        ],
                      ),
              ),
              if (controller.isBlur.value)
                Positioned.fill(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      top: MediaQuery.of(context).size.height / 1.6,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 1.0, color: Colors.white),
                            ),
                            color: Colors.black.withAlpha(0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(45.0),
                              topRight: Radius.circular(45.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                QTextField(
                                  hintText: "Masukan Email",
                                  value: null,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 20.0),
                                QTextField(
                                  hintText: "Masukan Password",
                                  isObscure: true,
                                  maxLines: 1,
                                  suffixIcon: Icons.password,
                                  value: null,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 20.0),
                                // ElevatedButton(
                                //   onPressed: () {
                                //     controller.initializeData();
                                //   },
                                //   child: controller.isLoading.value
                                //       ? CircularProgressIndicator()
                                //       : Text("Login"),
                                // ),
                              ],
                            ),
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
