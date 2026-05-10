import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../core/navigation/app_navigation.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/height_manager.dart';
import '../../../core/resources/icons_size_manager.dart';
import '../../../core/resources/padding_manager.dart';
import '../../../core/resources/radius_manager.dart';
import '../../../core/resources/route_manager.dart';
import '../../../core/resources/utils.dart';
import '../../../core/resources/width_manager.dart';
import '../../widget/main_button_design.dart';

class ButtonNavBarWidget extends StatelessWidget {
  const ButtonNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(PaddingManager.p20),
      child: SizedBox(
        height: HeightManager.h50,
        child: Row(
          children: [
            Container(
              height: HeightManager.h50,
              width: WidthManagers.w50,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: ColorManager.lightBlue,borderRadius: BorderRadius.circular(RadiusValuesManager.r12)),
              child: Icon(CupertinoIcons.cart,size: IconSizeManager.i25,),
            ),
            SizedBox(width: WidthManagers.w17,),
            InkWell(
                onTap: () {
                  AppNavigation.pushReplacementNamed(context, RoutesName.cart);
                },
                child: MainButtonDesign(width: WidthManagers.w252, text: Utils.buyNow, height: HeightManager.h50,))
          ],
        ),
      ),
    );
  }
}