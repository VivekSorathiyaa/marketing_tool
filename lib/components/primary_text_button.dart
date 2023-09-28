// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/utils/colors.dart';

class PrimaryTextButton extends StatelessWidget {
  String? title;
  VoidCallback onPressed;
  double? width;
  double? height;
  TextStyle? textStyle;
  Widget? trailingIcon;
  Widget? leadingIcon;
  LinearGradient? customGradientColor;

  PrimaryTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.trailingIcon,
    this.leadingIcon,
    this.customGradientColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      // decoration: BoxDecoration(
      //   gradient: customGradientColor ?? primaryGradientColor,
      //   borderRadius: BorderRadius.circular(10.r),
      // ),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
            height: height ?? 45.sp,
            width: width ?? Get.width,
            decoration: BoxDecoration(
              color: primaryBlack,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (leadingIcon != null)
                    Padding(
                      padding: EdgeInsets.only(right: 2.sp),
                      child: leadingIcon!,
                    ),
                  Text(
                    title ?? "Done",
                    style: textStyle ??
                        AppTextStyle.normalBold16.copyWith(color: primaryWhite),
                  ),
                  if (trailingIcon != null)
                    Padding(
                      padding: EdgeInsets.only(left: 2.sp),
                      child: trailingIcon!,
                    )
                ],
              ),
            )),
      ),
    );
  }
}
