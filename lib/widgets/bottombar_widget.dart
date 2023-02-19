import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/login_controller.dart';
import 'package:movie_app_flutter/controller/navigation_controller.dart';
import 'package:movie_app_flutter/views/home_page.dart';
import 'package:movie_app_flutter/views/movie_page.dart';
import 'package:movie_app_flutter/views/profile_page.dart';
import 'package:movie_app_flutter/views/search_page.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final NavigationController _navigationController =
      Get.put(NavigationController());
  final LoginController _loginController = Get.put(LoginController());
  gotonext() {
    Get.to(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.blueGrey,
      onTap: (value) {
        if (value == 0) _navigationController.navindex = 0;
        if (value == 1) _navigationController.navindex = 1;
        if (value == 2) _navigationController.navindex = 2;
        if (value == 2 && _loginController.sessionId == null)
          _navigationController.navindex = 3;
      },
      items: <Widget>[
        Icon(
          Icons.home,
          size: 30,
        ),
        Icon(
          Icons.search,
          size: 30,
        ),
        Icon(
          Icons.person,
          size: 30,
        )
      ],
    );
  }
}
