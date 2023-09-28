
import '../utils/app_constants.dart';
import '../utils/colors.dart';
import '../utils/common_method.dart';
import 'network_dio.dart';

NetworkRepository networkRepository = NetworkRepository();

class NetworkRepository {
  static final NetworkRepository _networkRepository =
      NetworkRepository._internal();

  factory NetworkRepository() {
    return _networkRepository;
  }
  NetworkRepository._internal();


  // customerUserLogin(context, authUserData) async {
  //   // try {
  //     final response = await NetworkDioHttp.postDioHttpMethod(
  //       context: context,
  //       url: AppConstants.apiBaseURL + AppConstants.customerUserLogin,
  //       data:  authUserData,
  //     );
  //   return checkResponse(
  //         response, CustomerLoginModel.fromJson(response['body']));
  //   // } catch (e) {
  //   //   CommonMethod().getXSnackBar("Error", e.toString(), redColor);
  //   // }
  // }

  Future<void> checkResponse(
    response,
    modelResponse,
  ) async {
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return modelResponse;
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        return modelResponse;
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    }
    else {
      showErrorDialog(message: response['body']['message']);
    }
  }

  Future<void> checkResponse2(
    response,
  ) async {
    if (response["error_description"] == null ||
        response["error_description"] == 'null') {
      if (response['body']['status'] == 200 ||
          response['body']['status'] == "200") {
        return response['body'];
      } else if (response['body']['status'] == 500 ||
          response['body']['status'] == "500") {
        showErrorDialog(message: response['body']['message']);
        return response['body'];
      } else {
        showErrorDialog(message: response['body']['message']);
      }
    } else {
      showErrorDialog(message: response['error_description']);
    }
  }

  void showErrorDialog({required String message}) {
    CommonMethod().getXSnackBar("Error", message.toString(), redColor);
  }
}
