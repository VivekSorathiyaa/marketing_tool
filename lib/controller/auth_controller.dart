// ignore_for_file: invalid_use_of_protected_member, unnecessary_null_comparison


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:marketing_tool/utils/app_preferences.dart';


import '../service/network_dio.dart';
import '../service/network_repository.dart';
import '../utils/app_constants.dart';
import '../utils/colors.dart';
import '../utils/common_method.dart';

class AuthController extends GetxController {
  // Future customerUserLogin(BuildContext context, String phoneNumber) async {
  //   var data = {'mobile_no': phoneNumber};
  //   CustomerLoginModel? response =
  //       await networkRepository.customerUserLogin(context, data);
  //   if (response != null &&
  //       response.status == 200 &&
  //       response.isActive != null) {
  //     if (response.isActive == 0) {
  //       Get.to(() => CustomerSignUpScreen(isFromEdit: false));
  //     } else {
  //       if (response.user != null && response.user!.id != null) {
  //         await AppPreferences.setCustomerId(response.user!.signUpId!);
  //         await AppPreferences.setAuthToken(response.token!);
  //         await NetworkDioHttp.setDynamicHeader(
  //             endPoint: AppConstants.apiBaseURL);
  //         Get.offAll(() => CustomerRequestHomeScreen());
  //         CommonMethod()
  //             .getXSnackBar("Success", response.message.toString(), greenColor);
  //       }
  //     }
  //   }
    // }


}
