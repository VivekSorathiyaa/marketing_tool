import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marketing_tool/utils/colors.dart';

import 'app_text_style.dart';

class CustomDropdown extends StatelessWidget {
  final List<dynamic>? items;
  final List<DropdownMenuItem<dynamic>>? customItems;
  final dynamic value;
  final String hintText;
  final String? labelText;
  final ValueChanged<dynamic> onChanged;
  final double? height;
  final double? width;
  final Color? color;

  const CustomDropdown(
      {this.items,
      required this.value,
      this.customItems,
      this.labelText,
      required this.hintText,
      required this.onChanged,
      this.height,
      this.width,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(top: 18.sp, bottom: 10.sp),
            child: Text(
              labelText ?? "",
              style: AppTextStyle.normalRegular14
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        InkWell(
          onTap: () {
            showDropdown(context);
          },
          child: Ink(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<dynamic>(
                value: value != "" ? value : null,
                items: customItems ??
                    (items != null
                        ? items!.map((dynamic item) {
                            return DropdownMenuItem<dynamic>(
                              value: item,
                              child: Text(
                                item.toString(),
                                style: AppTextStyle.normalRegular14,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList()
                        : []),
                isExpanded: true,
                hint: SizedBox(
                  width: Get.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hintText,
                          style: AppTextStyle.normalRegular14
                              .copyWith(color: hintTextColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                onChanged: (newValue) {
                  onChanged(newValue!);
                },
                buttonStyleData: ButtonStyleData(
                  height: height ?? 50,
                  width: width,
                  padding:  EdgeInsets.only(left: height != null ? 12 : 0, right: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: greyBorderColor,
                    ),
                    color: color,
                  ),
                ),
                iconStyleData: const IconStyleData(
                    icon: Icon(Icons.keyboard_arrow_down_outlined,
                        color: primaryBlack)),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  elevation: 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 12, right: 14),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showDropdown(BuildContext context) {
    final RenderBox itemBox = context.findRenderObject() as RenderBox;
    final Rect itemRect = itemBox.localToGlobal(Offset.zero) & itemBox.size;
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final Rect position = Rect.fromPoints(
      itemRect.topLeft.translate(0.0, itemRect.height),
      itemRect.bottomRight.translate(0.0, itemRect.height),
    );
    final RelativeRect rect = RelativeRect.fromRect(
      position,
      Offset.zero & overlay.size,
    );
    Navigator.of(context).push(
      DropdownMenuRoute<dynamic>(
        position: rect,
        items: customItems ??
            (items != null
                ? items!.map((dynamic item) {
                    return DropdownMenuItem<dynamic>(
                      value: item,
                      child: Text(
                        item.toString(),
                        style: AppTextStyle.normalRegular14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  }).toList()
                : []),
        selectedItem: value!,
        elevation: 8,
      ),
    );
  }
}

class DropdownMenuRoute<T> extends PopupRoute<T> {
  final RelativeRect position;
  final List<DropdownMenuItem<T>> items;
  final T selectedItem;
  final double elevation;

  DropdownMenuRoute({
    required this.position,
    required this.items,
    required this.selectedItem,
    this.elevation = 8.0,
  });

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => Colors.black54;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final Widget menu = _DropdownMenu<T>(
      route: this,
    );

    return Builder(
      builder: (BuildContext context) {
        return CustomSingleChildLayout(
          delegate: _DropdownMenuRouteLayout(position),
          child: menu,
        );
      },
    );
  }
}

class _DropdownMenuRouteLayout extends SingleChildLayoutDelegate {
  _DropdownMenuRouteLayout(this.position);

  final RelativeRect position;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.loose(constraints.biggest);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(position.left, position.top);
  }

  @override
  bool shouldRelayout(_DropdownMenuRouteLayout oldDelegate) {
    return position != oldDelegate.position;
  }
}

class _DropdownMenu<T> extends StatelessWidget {
  const _DropdownMenu({
    required this.route,
  });

  final DropdownMenuRoute<T> route;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];
    for (int itemIndex = 0; itemIndex < route.items.length; itemIndex += 1) {
      children.add(route.items[itemIndex]);
    }

    final Size size = MediaQuery.of(context).size;
    final double maxWidth = size.width - 2 * _kMenuScreenPadding;
    const double menuItemHeight = _kMenuItemHeight;
    final double height = (route.items.length * menuItemHeight)
        .clamp(0.0, size.height - 2 * _kMenuScreenPadding);

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth,
          maxHeight: height,
        ),
        child: Material(
          elevation: route.elevation,
          child: ListView(
            padding: EdgeInsets.zero,
            children: children,
          ),
        ),
      ),
    );
  }
}

const double _kMenuItemHeight = 48.0;
const double _kMenuScreenPadding = 8.0;
