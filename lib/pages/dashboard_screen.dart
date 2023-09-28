import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:marketing_tool/components/app_text_style.dart';
import 'package:marketing_tool/pages/contact/contact_screen.dart';
import 'package:marketing_tool/pages/home/home_screen.dart';
import 'package:marketing_tool/pages/profile/profile_screen.dart';
import 'package:marketing_tool/utils/colors.dart';

import 'group/group_screen.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  RxInt currentIndex = 0.obs;
  final List<Widget> _tabs = [
    HomeScreen(),
    ContactScreen(),
    GroupScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Obx(
        () => Center(
          child: _tabs.elementAt(currentIndex.value),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Obx(
              () => GNav(
                rippleColor: primaryColor.withOpacity(.4),
                hoverColor: primaryColor.withOpacity(.2),
                gap: 8,
                activeColor: primaryColor,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: primaryColor.withOpacity(.2),
                color: primaryBlack,
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.userFriends,
                    text: 'Contact',
                  ),
                  GButton(
                    icon: LineIcons.users,
                    text: 'Group',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: currentIndex.value,
                onTabChange: (index) {
                  currentIndex.value = index;
                },
              ),
            ),
          ),
        ),
      ),
      
      
      
      //  Obx(
      //   () =>
      //    BottomNavigationBar(
      //     elevation: 10,
      //     unselectedLabelStyle:
      //         const TextStyle(color: primaryBlack, fontSize: 14),
      //     backgroundColor: primaryWhite,
      //     fixedColor: primaryColor,
      //     unselectedItemColor: greyColor,
      //     // unselectedFontSize: 14,
      //     type: BottomNavigationBarType.fixed,
      //     // selectedLabelStyle:
      //     //     AppTextStyle.normalRegular14.copyWith(color: primaryBlack),
      //     // unselectedLabelStyle:
      //     //     AppTextStyle.normalRegular14.copyWith(color: primaryBlack),
      //     currentIndex: currentIndex.value,
      //     onTap: (index) {
      //       currentIndex.value = index;
      //     },
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.call),
      //         label: 'Contact',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.group),
      //         label: 'Group',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: 'Profile',

      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
