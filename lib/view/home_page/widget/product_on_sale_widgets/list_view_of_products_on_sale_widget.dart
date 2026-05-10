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
import 'list_view_design_of_products_on_sale.dart';

class ListViewOfProductsOnSaleWidget extends StatelessWidget {
  const ListViewOfProductsOnSaleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h230,
      child: ListView.separated(
        padding:  EdgeInsetsGeometry.symmetric(
          horizontal: HorizontalPaddingManager.p20,

        ),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: ConstValueManager.listProductsOnSale.length,
        separatorBuilder: (context, index) => SizedBox(width: WidthManagers.w20),
        itemBuilder: (context, index) {
          return ListViewDesignOfProductsOnSale(
            model: ConstValueManager.listProductsOnSale[index],
          );
        },
      ),
    );
  }
}