// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketing_tool/utils/colors.dart';

class ShadowContainerWidget extends StatelessWidget {
  final Widget widget;
  double? padding;
  double? radius;
  BorderRadiusGeometry? customRadius;
  double? blurRadius;
  Color? shadowColor;
  Color? borderColor;
  Color? color;

  ShadowContainerWidget(
      {Key? key,
      required this.widget,
      this.padding,
      this.radius,
      this.blurRadius,
      this.customRadius,
      this.borderColor,
      this.shadowColor,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(padding ?? 15.0),
        decoration: BoxDecoration(
          color: color ?? primaryWhite,
          boxShadow: [
            BoxShadow(
              blurRadius: blurRadius ?? 9,
              // spreadRadius: 1,
              color: shadowColor ?? greyColor.withOpacity(.5),
            ),
          ],
          borderRadius: customRadius ?? BorderRadius.circular(radius ?? 8.r),
          border: Border.all(color: borderColor ?? greyColor, width: 1),
        ),
        child: widget);
  }
}
