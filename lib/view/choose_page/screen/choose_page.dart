import 'package:flutter/material.dart';

import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../widget/continue_as_widget.dart';


class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorManager.backGround1, ColorManager.backGround2],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsValuesManager.logo,),
            ContinueAsWidget(title: Utils.continueAsUser, description: Utils.browseAndOrderMedicines, icon: Icons.people,onTap: () {
              AppNavigation.pushAndRemoveUntil(context, RoutesName.home);
            },),
            SizedBox(height: HeightManager.h20),
            ContinueAsWidget(title: Utils.continueAsPharmacy, description: Utils.manageYourPharmacy, icon: Icons.apartment,onTap: () {
              AppNavigation.pushAndRemoveUntil(context, RoutesName.pharmacyDashboard);
            },),

          ],
        ),
      ),
    );
  }
}
