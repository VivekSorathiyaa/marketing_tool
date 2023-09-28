import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart'
    as PermissionHandler;
import 'package:permission_handler/permission_handler.dart';
import 'package:marketing_tool/components/custom_dialog.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../app.dart';
import '../main.dart';

class CommonMethod {
  void getXSnackBar(String title, String message, Color? color) {
    Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: primaryWhite,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      duration: const Duration(seconds: 2),
      borderRadius: 10,
      barBlur: 10,
    );
  }

  static String formateDate(date) {
    if (date == null || date == '' || date == 'null') {
      return '';
    }
    DateTime isoDate = DateTime.parse(date);
    DateFormat desiredFormat = DateFormat('dd/MM/yyyy');
    String formattedDate = desiredFormat.format(isoDate);
    return formattedDate;
  }

  static Future launchInBrowser(String? url) async {
    log("--url-- $url");
    if (url == null) {
      CommonMethod().getXSnackBar("Erorr", "Something Went Wrong", redColor);
      return;
    } else {
      if (!await launchUrl(
        Uri.parse(url),
        // mode: LaunchMode.externalApplication,
        mode: LaunchMode.inAppWebView,
      )) {
        throw Exception('Could not launch $url');
      }
    }
  }

  static Future<List<Map<String, dynamic>>> getStoredContacts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? contactsJson = prefs.getString('contacts');

    if (contactsJson != null) {
      List<dynamic> contactsList = jsonDecode(contactsJson);
      return contactsList.cast<Map<String, dynamic>>();
    } else {
      return [];
    }
  }

  

  static Future fetchAndStoreContacts() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final PermissionHandler.PermissionStatus status =
          await PermissionHandler.Permission.contacts.request();
      if (status.isGranted) {
        Iterable<Contact> contacts = await ContactsService.getContacts();
        List<Map<String, dynamic>> contactList = [];
        for (Contact contact in contacts) {
          if (contact.phones != null) {
            List<Item> phones = contact.phones!.toList();
            List<String> phoneList = [];
            if (phones.isNotEmpty) {
              String name = contact.displayName ?? '';
              Set<String> uniquePhoneNumbers = {};
              for (var number in phones) {
                if (number.value != null) {
                  String sanitizedPhoneNumber =
                      number.value!.replaceAll(RegExp(r'[^\d]'), '');
                  if (sanitizedPhoneNumber.isNotEmpty) {
                    uniquePhoneNumbers.add(sanitizedPhoneNumber);
                  }
                  phoneList.add(number.value!);
                }
              }
              List<String> mergedPhoneNumbers = uniquePhoneNumbers.toList();
              Map<String, dynamic> contactData = {
                'name': name,
                'phoneNumber': mergedPhoneNumbers,
              };
              contactList.add(contactData);
            }
          }
        }
        String contactsJson = jsonEncode(contactList);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('contacts', contactsJson);
      } else {
        print('Permission to access contacts denied.');
        await PermissionHandler.Permission.contacts.request();
      }
    } catch (e) {
      print('Error syncing contacts: $e');
    }
  }

  static String extractAddressFromURL(String link) {
    if (!link.contains('http')) {
      return link;
    }
    final uri = Uri.parse(link);
    String address = '';
    if (uri.queryParameters.containsKey("query")) {
      final query = uri.queryParameters["query"];
      address = query!;
    } else {
      address = '';
    }
    return address;
  }

  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  static Future<String> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String androidId = 'N/A';
    String iosIdfv = 'N/A';

    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        androidId = androidInfo.id;
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        iosIdfv = iosInfo.identifierForVendor!;
      }
    } catch (e) {
      print('Error getting device identifiers: $e');
    }

    print('Android ID: $androidId');
    print('iOS IDFV: $iosIdfv');
    return androidId;
  }

  static String generateGoogleMapsLink(String address) {
    final String encodedAddress = Uri.encodeComponent(address);
    final String mapsUrl =
        'https://www.google.com/maps/search/?api=1&query=$encodedAddress';
    print(mapsUrl);
    return mapsUrl;
  }

  String chechFrequency(int id) {
    String name = '';
    if (id == 1) {
      name = 'On Request';
    } else if (id == 2) {
      name = 'Daily';
    } else if (id == 3) {
      name = 'Weekly';
    } else if (id == 4) {
      name = 'Monthly';
    }
    return name;
  }

  static checkNetWorkConnection() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      CustomDialog.showNoInternetConnectionDialog();
    }
    connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        CustomDialog.showNoInternetConnectionDialog();
        // internetError.addOverlayEntry(navigatorKey.currentContext);
      } else {
        Get.back();
        // internetError.removeOverlay();
      }
    });
  }
}
