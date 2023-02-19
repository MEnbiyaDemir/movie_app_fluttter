import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/profile_controller.dart';
import 'package:movie_app_flutter/controller/upcoming_controller.dart';

class ProfileList extends StatefulWidget {
  const ProfileList({Key? key}) : super(key: key);

  @override
  State<ProfileList> createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 400.0,
        child: FutureBuilder(
            future: _profileController.fetchFavoriteData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(8),
                  itemCount: _profileController.favList[0].results.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(children: [
                        Image.network('https://image.tmdb.org/t/p/w185' +
                            '${_profileController.favList[0].results[index].posterPath}'),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(
                          Icons.favorite_sharp,
                          color: Colors.red,
                          size: 50.0,
                        )
                      ]),
                    );
                  },
                );
              } else {
                return SizedBox(
                  width: 220,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            }));
  }
}
