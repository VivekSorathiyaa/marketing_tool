import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/controller/contact_controller.dart';
import 'package:marketing_tool/utils/app_asset.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:marketing_tool/utils/static_decoration.dart';

import '../../components/common_app_bar.dart';

class VisitCustomerScreen extends StatefulWidget {
  VisitCustomerScreen({Key? key}) : super(key: key);

  @override
  State<VisitCustomerScreen> createState() => _VisitCustomerScreenState();
}

class _VisitCustomerScreenState extends State<VisitCustomerScreen> {
  var controller = Get.put(ContactController());

  @override
  void initState() {
    controller.refreshContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: CommonAppBar(
        title: 'Visit Customers',
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.storedContactsList.length,
            itemBuilder: (context, index) {
              final contact = controller.storedContactsList[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      color: lightGreyColor,
                      borderRadius: circular10BorderRadius),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  contact['name'] + ' Group' ?? '',
                                  style: AppTextStyle.normalSemiBold14,
                                ),
                              ),
                              Text(
                                '20 Contacts',
                                style: AppTextStyle.normalRegular14
                                    .copyWith(fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          height05,
                          Column(
                            children: (contact['phoneNumber'] as List<dynamic>)
                                .map<Widget>(
                              (phone) {
                                return Text(
                                  phone.toString(),
                                  style: AppTextStyle.normalRegular14
                                      .copyWith(fontWeight: FontWeight.w300),
                                );
                              },
                            ).toList(),
                          ),
                          height05,
                          Text(
                            '365, Abc soc, , mota varachha, surat-395001',
                            style: AppTextStyle.normalRegular14
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                          height05,
                          Row(
                            children: [
                              Image.asset(
                                AppAsset.icPhone,
                                height: 36.sp,
                              ),
                              width10,
                              Image.asset(
                                AppAsset.icSms,
                                height: 36.sp,
                              ),
                              width10,
                              Image.asset(
                                AppAsset.icWhatsapp,
                                height: 36.sp,
                              ),
                              width10,
                              Image.asset(
                                AppAsset.icEye,
                                height: 36.sp,
                              ),
                            ],
                          )
                        ]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
