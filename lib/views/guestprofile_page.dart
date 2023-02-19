import 'package:flutter/material.dart';
import 'package:movie_app_flutter/controller/profile_controller.dart';
import 'package:movie_app_flutter/widgets/bottombar_widget.dart';
import 'package:movie_app_flutter/widgets/moviecard_widget.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/widgets/profilelist_widget.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ProfileController _profileController = Get.put(ProfileController());
    //String? avatarpath=_profileController.playingList[0].avatar.tmdb.avatarPath;
    //String? username=_profileController.playingList[0].username;

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
            child: FutureBuilder(
                future: _profileController.fetchProfileData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.blueGrey,
                          minRadius: 60.0,
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                                'https://www.shutterstock.com/image-vector/guest-linear-icon-modern-outline-260nw-1230373900.jpg'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Guest',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SizedBox(
                      width: 220,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                }),
          ),
          Text("Favorites",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38)),
        ],
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
