// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/controller/auth_controller.dart';
import 'package:marketing_tool/pages/dashboard_screen.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:marketing_tool/utils/static_decoration.dart';
import 'package:marketing_tool/utils/validators.dart';

import '../../components/primary_text_button.dart';
import '../../components/text_form_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var controller = Get.put(AuthController());
  TextEditingController phoneNumberTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController deviceIdTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      customHeight(60),
                      FadeInDownBig(
                        child: Text(
                          'Log In',
                          style: AppTextStyle.normalBold26,
                        ),
                      ),
                      height10,
                      FadeInDownBig(
                        child: Text(
                          'Let’s Get To work',
                          style: AppTextStyle.normalRegular14
                              .copyWith(color: greyColor),
                        ),
                      ),
                      height30,
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Column(
                            children: [
                              FadeInRightBig(
                                child: TextFormFieldWidget(
                                  labelText: 'Mobile No.',
                                  hintText: 'Enter mobile no.',
                                  controller: phoneNumberTextController,
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    return Validators.validateMobile(value!);
                                  },
                                ),
                              ),
                              FadeInLeftBig(
                                child: PasswordWidget(
                                  labelText: 'Password',
                                  hintText: 'Enter password',
                                  controller: passwordTextController,
                                  validator: (value) {
                                    return Validators.validateRequired(
                                        value!, 'Password');
                                  },
                                ),
                              ),
                              height20,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FadeInUp(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: PrimaryTextButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {}
                    Get.to(() => DashBoardScreen());
                  },

                  title: 'Log In',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
