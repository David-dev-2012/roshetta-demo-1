import 'package:flutter/material.dart';

import '../../../../core/navigation/app_navigation.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/const_values_manager.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/height_manager.dart';
import '../../../../core/resources/padding_manager.dart';
import '../../../../core/resources/radius_manager.dart';
import '../../../../core/resources/width_manager.dart';
import '../../../../model/recent_doctors_model.dart';
import '../../../../model/top_doctors_model.dart';

class ItemRecentDoctor extends StatelessWidget {
  const ItemRecentDoctor({super.key, required this.model});

  final RecentDoctorModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidthManagers.w100,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              AppNavigation.pushNamed(context, model.route);
            },
            child: Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: HeightManager.h40,
                backgroundImage: AssetImage(model.drImage),
              ),
            ),
          ),
          SizedBox(height: HeightManager.h10),
          Expanded(
            child: Text(
              textAlign: TextAlign.center,
              model.drName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorManager.grey,
                fontSize: FontSizeManagers.f15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}