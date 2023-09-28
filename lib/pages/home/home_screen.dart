import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:marketing_tool/utils/static_decoration.dart';

import '../../components/common_app_bar.dart';
import '../../components/custom_dropdown_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  RxList shoplist = [
    'Prime Paw',
    'Eclipse Rises Builders',
    'AigleSoft',
    'Accent-e-Technology',
    'Mod Home',
    'Ultimate Design',
    'Soylent',
    'Express Estates Advertising',
    'Sofa So Good',
    'Deal Design',
  ].obs;
  RxString selectedShop = ''.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: CommonAppBar(
        title: 'Home',
        hideLeadingIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Expanded(
              child: ListView(children: [
                Obx(
                  () => CustomDropdown(
                    hintText: 'Select Shop',
                    items: shoplist.value,
                    onChanged: (value) {
                      selectedShop.value = value;
                    },
                    value:
                        selectedShop.value.isEmpty ? null : selectedShop.value,
                  ),
                ),
                height10,
                Row(
                  children: [
                    Expanded(
                        child: informationWidget(
                            title: 'Total Contacts',
                            value: '10',
                            bgColor: lightRedColor,
                            icon: LineIcons.ad)),
                    customWidth(16),
                    Expanded(
                        child: informationWidget(
                            title: 'Total Group',
                            value: '10',
                            icon: LineIcons.ad,
                            bgColor: lightOrangeColor)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: informationWidget(
                            title: 'visit customer',
                            value: '10',
                            icon: LineIcons.ad,
                            bgColor: Colors.grey)),
                    customWidth(16),
                    Expanded(
                        child: informationWidget(
                            title: 'visit pending customer',
                            value: '10',
                            icon: LineIcons.ad,
                            bgColor: lightGreenColor)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: informationWidget(
                            title: 'Conversion Rate',
                            value: '2.01%',
                            icon: LineIcons.ad,
                            bgColor: lightNeonColor)),
                    customWidth(16),
                    Expanded(
                        child: informationWidget(
                            title: 'Social Shares',
                            value: '10',
                            icon: LineIcons.ad,
                            bgColor: lightBlueColor)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: informationWidget(
                            title: 'Total SMS',
                            value: '10',
                            icon: LineIcons.ad,
                            bgColor: lightPurpleColor)),
                    customWidth(16),
                    Expanded(
                        child: informationWidget(
                            title: 'Total WhatsApp Message ',
                            value: '20',
                            icon: LineIcons.ad,
                            bgColor: lightPinkColor)),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget informationWidget(
      {required String title,
      required String value,
      VoidCallback? onTap,
      required Color bgColor,
      required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        width: Get.width,
        height: 108.sp,
        decoration: BoxDecoration(
            color: bgColor.withOpacity(.2),
            border: Border.all(color: bgColor.withOpacity(.3)),
            borderRadius: BorderRadius.circular(14.r)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 12),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40.sp,
                        width: 40.sp,
                        decoration: BoxDecoration(
                            color: primaryWhite,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Icon(
                          icon,
                          color: bgColor,
                        ),
                      ),
                      width12,
                      Text(
                        value,
                        style: AppTextStyle.normalBold24.copyWith(
                          color: bgColor,
                        ),
                      ),
                    ],
                  ),
                  height10,
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyle.normalBold12
                          .copyWith(color: primaryBlack),
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
  // Widget informationWidget(
  //     {required String title, required String value, VoidCallback? onTap}) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 20),
  //     child: Container(
  //       width: Get.width,
  //       height: 83.sp,
  //       decoration: BoxDecoration(
  //           color: greyContainerColor, borderRadius: circular10BorderRadius),
  //       child: Center(
  //         child: Column(mainAxisSize: MainAxisSize.min, children: [
  //           Text(
  //             value,
  //             style: AppTextStyle.normalSemiBold22,
  //           ),
  //           height05,
  //           Text(
  //             title,
  //             style: AppTextStyle.normalRegular14,
  //             textAlign: TextAlign.center,
  //             // maxLines: 1,
  //             overflow: TextOverflow.ellipsis,
  //           ),
  //         ]),
  //       ),
  //     ),
  //   );
  // }
}
