import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusValuesManager.r12),
      ),
      child: SizedBox(
        height: HeightManager.h300,
        width: WidthManagers.w300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: FontSizeManagers.f100,
              color: ColorManager.green,
            ),
            Text(
              Utils.welcomeBack,
              style: TextStyle(fontSize: FontSizeManagers.f20),
            ),
            Text(Utils.welcomeMessage),
            Text(Utils.intoRoshetaApp),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                AppNavigation.pushAndRemoveUntil(context, RoutesName.choose);
              },
              child: Text(Utils.goToHome),
            ),
          ],
        ),
      ),
    );
  }
}