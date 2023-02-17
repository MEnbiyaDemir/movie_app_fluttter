import 'package:flutter/material.dart';
import 'package:movie_app_flutter/controller/profile_controller.dart';
import 'package:movie_app_flutter/widgets/bottombar_widget.dart';
import 'package:movie_app_flutter/widgets/moviecard_widget.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/widgets/profilelist_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    ProfileController _profileController=Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: Center(
          child: const Text('Profile Page'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.blueGrey.shade100],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/250?image=10'),
                      ),
                    ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'M. Enbiya Demir',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ProfileList(),
        ],
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
