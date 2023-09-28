import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketing_tool/app.dart';
import 'package:marketing_tool/service/internet_error.dart';
import 'package:marketing_tool/utils/app_constants.dart';
import 'package:marketing_tool/service/network_dio.dart';

import 'utils/app_preferences.dart';

final Connectivity connectivity = Connectivity();
final InternetError internetError = InternetError();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  await AppPreferences.init();
  await NetworkDioHttp.setDynamicHeader(endPoint: AppConstants.apiBaseURL);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemStatusBarContrastEnforced: false,
    ),
  );
  runApp(MyApp());
}
