import 'package:get/get.dart';

import '../utils/common_method.dart';

class ContactController extends GetxController {
  RxList<Map<String, dynamic>> storedContactsList =
      <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    CommonMethod.getStoredContacts().then((contacts) {
      storedContactsList.value = contacts;
    });
    super.onInit();
  }

  Future refreshContact() async {
    await CommonMethod.fetchAndStoreContacts();
    // storedContactsList.value = [];
    CommonMethod.getStoredContacts().then((contacts) {
      storedContactsList.value = contacts;
    });
    storedContactsList.refresh();
  }
}
