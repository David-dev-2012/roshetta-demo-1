import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../widget/login_button.dart';
import '../widget/login_form.dart';
import '../widget/login_header.dart';
import '../widget/success_dialog.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: WidthManagers.w20,
            vertical: HeightManager.h20,
          ),
          child: Column(
            children: [
              SizedBox(height: HeightManager.h80),

              const LoginHeader(),

              SizedBox(height: HeightManager.h40),

              const LoginForm(),

              SizedBox(height: HeightManager.h15),

              /// Forget Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    AppNavigation.pushNamed(context, RoutesName.forgetPassword);
                  },
                  child: const Text(Utils.forgetPassword),
                ),
              ),

              SizedBox(height: HeightManager.h15),

              LoginButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const SuccessDialog(),
                  );
                },
              ),

              SizedBox(height: HeightManager.h20),

              /// Go to Sign Up
              TextButton(
                onPressed: () {
                  AppNavigation.pushNamed(context, RoutesName.signUp);
                },
                child: const Text(Utils.signIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
