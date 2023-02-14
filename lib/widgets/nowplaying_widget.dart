import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controller/api_controller.dart';

class Playing extends StatefulWidget {
  const Playing({Key? key}) : super(key: key);

  @override
  State<Playing> createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 400.0,
        child: FutureBuilder(
            future: _controller.fetchPlayingData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(8),
                  itemCount: _controller.playingList[0].results.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(children: [
                        Image.network('https://image.tmdb.org/t/p/w185' +
                            '${_controller.playingList[0].results[index].posterPath}'),
                        Text(
                            '${_controller.playingList[0].results[index].title}'),
                        Text(
                            '${_controller.playingList[0].results[index].voteAverage}'),
                        Text(
                            '${_controller.playingList[0].results[index].releaseDate}'
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
            }));
  }
}
