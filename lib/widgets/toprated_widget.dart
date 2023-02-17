import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/toprated_controller.dart';

class TopRated extends StatefulWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  final TopratedController _tcontroller = Get.put(TopratedController());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 400.0,
        child: FutureBuilder(
            future: _tcontroller.fetchTopratedData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  itemCount: _tcontroller.playingList[0].results.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(children: [
                        Image.network('https://image.tmdb.org/t/p/w185' +
                            '${_tcontroller.playingList[0].results[index].posterPath}'),
                        Text(
                            '${_tcontroller.playingList[0].results[index].title}'),
                        Text(
                            '${_tcontroller.playingList[0].results[index].voteAverage}'),
                        Text(
                            '${_tcontroller.playingList[0].results[index].releaseDate}'
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
