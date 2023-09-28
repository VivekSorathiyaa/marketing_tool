import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/controller/contact_controller.dart';
import 'package:marketing_tool/pages/contact/add_contact_screen.dart';
import 'package:marketing_tool/pages/contact/filter_screen.dart';
import 'package:marketing_tool/pages/contact/select_contact_screen.dart';
import 'package:marketing_tool/utils/app_asset.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:marketing_tool/utils/static_decoration.dart';

import '../../components/common_app_bar.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        title: 'Contact',
        hideLeadingIcon: true,
        actionWidget: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.to(() => FilterScreen());
              },
              icon: Icon(
                Icons.filter_list_rounded,
                color: appBarIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => SelectContactScreen());
              },
              icon: Icon(
                Icons.search,
                color: appBarIconColor,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.storedContactsList.length,
            itemBuilder: (context, index) {
              final contact = controller.storedContactsList[index];
              return
                  //  ListTile(
                  //   title: Text(contact['name'] ?? ''),
                  //   subtitle: Text(contact['phoneNumber'] ?? ''),
                  // );
                  Padding(
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
                          Text(
                            contact['name'] ?? '',
                            style: AppTextStyle.normalSemiBold14,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          controller.update();
          Get.to(() => AddContactScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
