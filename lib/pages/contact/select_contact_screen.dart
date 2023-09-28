import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/controller/contact_controller.dart';
import 'package:marketing_tool/pages/contact/add_contact_screen.dart';
import 'package:marketing_tool/pages/contact/filter_screen.dart';
import 'package:marketing_tool/utils/app_asset.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:marketing_tool/utils/static_decoration.dart';

import '../../components/common_app_bar.dart';

class SelectContactScreen extends StatefulWidget {
  SelectContactScreen({Key? key}) : super(key: key);

  @override
  State<SelectContactScreen> createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  var controller = Get.put(ContactController());

  @override
  void initState() {
    controller.refreshContact();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      appBar: CommonAppBar(
        title: 'Select Contact',
        // hideLeadingIcon: true,
        actionWidget: Row(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Select All',
                  style: AppTextStyle.normalRegular14
                      .copyWith(color: appBarTitleColor),
                ))
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
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: greenColor,
                          child: Text(
                            '${contact['name'].isNotEmpty ? contact['name'][0] : ''}',
                            style: AppTextStyle.normalSemiBold20
                                .copyWith(color: greyColor),
                          ),
                        ),
                        width10,
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact['name'] ?? '',
                                  style: AppTextStyle.normalSemiBold14,
                                ),
                                height05,
                                Column(
                                  children:
                                      (contact['phoneNumber'] as List<dynamic>)
                                          .map<Widget>(
                                    (phone) {
                                      return Text(
                                        phone.toString(),
                                        style: AppTextStyle.normalRegular14
                                            .copyWith(
                                                fontWeight: FontWeight.w300),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ]),
                        ),
                        Icon(
                          Icons.circle_outlined,
                          color: greyColor,
                        )
                      ],
                    ),
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
