import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/upcoming_controller.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final UpcomingController _upcomingController = Get.put(UpcomingController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 400.0,
        child: FutureBuilder(
            future: _upcomingController.fetchUpcomingData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  itemCount: _upcomingController.playingList[0].results.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(children: [
                        Image.network('https://image.tmdb.org/t/p/w185' +
                            '${_upcomingController.playingList[0].results[index].posterPath}'),
                        Text(
                            '${_upcomingController.playingList[0].results[index].title}'),
                        Text(
                            '${_upcomingController.playingList[0].results[index].voteAverage}'),
                        Text(
                            '${_upcomingController.playingList[0].results[index].releaseDate}'
                                .substring(0, 10))
                      ]),
                    );
                  },
                );
              } else {
                return SizedBox(
                  width: 220,
                  child: CircularProgressIndicator(),
                );
              }
            })
    );
  }
}
