import 'package:flutter/material.dart';

import '../../components/common_app_bar.dart';
import '../../utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBackgroundColor,
        appBar: CommonAppBar(
          title: 'Profile Screen',
          hideLeadingIcon: true,
        ),
        body: Column(
          children: [],
        ));
  }
}
