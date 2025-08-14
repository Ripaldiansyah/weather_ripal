import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_ripaldiansyah/core.dart';

import '../../../shared/widget/q_button.dart';

class FieldLogin extends StatelessWidget {
  const FieldLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        QTextField(
          hintText: "Masukan Email",
          value: null,
          onChanged: (value) {},
        ),

        QTextField(
          hintText: "Masukan Password",
          isObscure: true,
          maxLines: 1,
          suffixIcon: Icons.password,
          value: null,
          onChanged: (value) {},
        ),
        SizedBox(height: 5.0),
        QButton(
          label: "Login",
          onPressed: () {
            Get.find<LoginController>().redirectToHome();
          },
        ),
      ],
    );
  }
}
