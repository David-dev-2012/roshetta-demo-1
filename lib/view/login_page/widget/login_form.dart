import 'package:flutter/material.dart';

import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';


class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: Utils.email,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
            ),
          ),
        ),
        SizedBox(height: HeightManager.h20),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText: Utils.password,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
            ),
          ),
        ),
      ],
    );
  }
}