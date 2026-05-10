import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/day_selecter.dart';
import '../../../controller/time_selectore.dart';
import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/assets_values_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/fonts_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../../../core/widget/doctor_details.dart';



class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.blackText,
            size: WidthManagers.w20,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          Utils.details,
          style: TextStyle(
            color: ColorManager.blackText,
            fontSize: FontSizeManagers.f18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: WidthManagers.w24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: HeightManager.h15),
                DoctorDetailsCard(
                  image: AssetsValuesManager.doctorMarcusImage,
                  doctorName: Utils.drMarcusHorizon,
                  doctorAddress: Utils.cardiologist,
                ),
                SizedBox(height: HeightManager.h35),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Utils.about,
                    style: TextStyle(
                      fontSize: FontSizeManagers.f16,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.blackText,
                    ),
                  ),
                ),
                Text(
                  Utils.aboutDrMarcus,
                  style: TextStyle(
                    fontSize: FontSizeManagers.f12,
                    color: ColorManager.hintTextGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: HeightManager.h30),
                DaysSelector(),
                SizedBox(height: HeightManager.h30),

                Divider(
                  height: HeightManager.h1,
                  color: ColorManager.hintTextGrey,
                ),
                SizedBox(height: HeightManager.h30),

                TimeSelector(),
                SizedBox(height: HeightManager.h45),
                Row(
                  children: [
                    // icon box
                    Container(
                      width: WidthManagers.w60,
                      height: HeightManager.h60,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(RadiusValuesManager.r20),
                      ),
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 26.sp,
                        color: Colors.teal,
                      ),
                    ),

                    SizedBox(width: WidthManagers.w15),

                    // button
                    Expanded(
                      child: GestureDetector(
                        onTap: () => AppNavigation.pushNamed(
                          context,
                          RoutesName.appointment,
                        ),
                        child: Container(
                          height: HeightManager.h60,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(RadiusValuesManager.r30),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            Utils.bookAppointment,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSizeManagers.f16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}