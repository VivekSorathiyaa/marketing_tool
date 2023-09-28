import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/pages/auth/login_screen.dart';
import 'package:marketing_tool/utils/colors.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          // navigatorKey: navigatorKey,
          title: 'Rajkot Lab',

          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: appBackgroundColor,
            fontFamily: AppTextStyle.fontFamilyInter,
            hintColor: primaryBlack,
            iconTheme: const IconThemeData(color: primaryBlack),
            colorScheme:
                ColorScheme.fromSwatch().copyWith(secondary: primaryColor),
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
