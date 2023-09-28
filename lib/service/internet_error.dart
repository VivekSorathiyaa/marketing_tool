import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/utils/app_asset.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/components/primary_text_button.dart';
import 'package:marketing_tool/utils/colors.dart';
import 'package:marketing_tool/utils/static_decoration.dart';

class InternetError {
  static final _instance = InternetError.internal();
  factory InternetError() => _instance;
  InternetError.internal();

  static OverlayEntry? entry;

  void show(context, page) => addOverlayEntry(context);
  void hide() => removeOverlay();

  bool get isShow => entry != null;

  addOverlayEntry(context) {
    if (entry != null) return;
    entry = OverlayEntry(builder: (BuildContext context) {
      return LayoutBuilder(builder: (_, BoxConstraints constraints) {
   return 
   
   Material(
          color: primaryWhite,
          child: 
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                //  Image.asset(AppAsset.noInternet,),
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    "No internet connection",
                    style: AppTextStyle.normalBold20,
                  ),
                  height20,
                  Text(
                    "Please Check your internet connection and try again.",
                    style: AppTextStyle.normalRegular16
                        .copyWith(color: primaryBlack.withOpacity(0.40)),
                    textAlign: TextAlign.center,
                  ),
                  customHeight(30),

                  height15,

                ],
              ),
            ),
          ),
        );  });
    });

    addoverlay(entry!, context);
  }

  addoverlay(OverlayEntry entry, context) async {
    Overlay.of(context)!.insert(entry);
  }

  removeOverlay() {
    entry?.remove();
    entry = null;
  }
}
