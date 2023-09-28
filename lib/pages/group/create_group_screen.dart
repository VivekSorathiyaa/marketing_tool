// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/pages/dashboard_screen.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:marketing_tool/utils/static_decoration.dart';
import 'package:marketing_tool/utils/validators.dart';

import '../../components/common_app_bar.dart';
import '../../components/primary_text_button.dart';
import '../../components/text_form_field_widget.dart';
import 'group_screen.dart';

class CreateGroupScreen extends StatelessWidget {
  CreateGroupScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: CommonAppBar(
        title: 'Create Group',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.sp),
                        child: Column(
                          children: [
                            TextFormFieldWidget(
                              labelText: 'Group name',
                              hintText: 'Enter group name',
                              controller: null,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                return Validators.validateMobile(value!);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20),
            child: PrimaryTextButton(
              onPressed: () {
                // if (_formKey.currentState!.validate()) {}
                Get.to(() => GroupScreen());
              },
              title: 'Done',
            ),
          ),
        ],
      ),
    );
  }
}
