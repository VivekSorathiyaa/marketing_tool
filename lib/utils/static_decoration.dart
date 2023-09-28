import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/app_text_style.dart';

// Padding
 EdgeInsets horizonatal20 = EdgeInsets.symmetric(horizontal: 20);
EdgeInsets horizonatal10 = EdgeInsets.symmetric(horizontal: 10);
EdgeInsets customVerticalHorizontal20({double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: 20.sp, vertical: vertical.sp);

EdgeInsets customVerticalHorizontal10({double vertical = 0}) =>
    EdgeInsets.symmetric(horizontal: 10.sp, vertical: vertical.sp);

SizedBox customWidth(double width) => SizedBox(width: width);
 SizedBox width05 = SizedBox(width: 05.sp);
 SizedBox width10 = SizedBox(width: 10.sp);
  SizedBox width12 = SizedBox(width: 12.sp);
 SizedBox width15 = SizedBox(width: 15.sp); 
 SizedBox width20 = SizedBox(width: 20.sp); 
 SizedBox width30 = SizedBox(width: 30.sp); 
SizedBox customHeight(double height) => SizedBox(height: height);
 SizedBox height05 = SizedBox(height: 05.sp);
SizedBox height08 = SizedBox(height: 08.sp);
 SizedBox height10 = SizedBox(height: 10.sp);
 SizedBox height12 = SizedBox(height: 12.sp);
 SizedBox height15 = SizedBox(height: 15.sp);
 SizedBox height20 = SizedBox(height: 20.sp);
 SizedBox height30 = SizedBox(height: 30.sp);

BorderRadius circularBorderRadius(double radius) =>
    BorderRadius.circular(radius);
BorderRadius circular5BorderRadius = BorderRadius.circular(4.r);
BorderRadius circular8BorderRadius = BorderRadius.circular(8.r);
BorderRadius circular10BorderRadius = BorderRadius.circular(10.r);
BorderRadius circular15BorderRadius = BorderRadius.circular(15.r);
BorderRadius circular20BorderRadius = BorderRadius.circular(20.r);
BorderRadius circular24BorderRadius = BorderRadius.circular(24.r);
BorderRadius circular25BorderRadius = BorderRadius.circular(25.r);
BorderRadius circular30BorderRadius = BorderRadius.circular(30.r);
Widget buildRow(String title, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Text(
          title,
          style: AppTextStyle.normalSemiBold14,
        )),
        Expanded(
            child: Text(
          value,
          style: AppTextStyle.normalRegular14,
        )),
      ],
    ),
  );
}
