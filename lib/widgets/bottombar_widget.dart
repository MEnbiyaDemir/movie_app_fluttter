import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  int _index = 0;

  gotonext() {
    Get.to(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (value) {
          if (value == 0) Get.to(HomePage());
          if (value == 1) Get.to(SearchPage());
          if (value == 2) Get.to(ProfilePage());
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.blueGrey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            label: 'Profile',
          )
        ]);
  }
}
