import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/search_controller.dart';
import 'package:movie_app_flutter/views/movie_page.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(MoviePage()),
      child: Card(
        child: Row(
          children: [
            SizedBox(
                child: Image.network('https://image.tmdb.org/t/p/w185' +
                    '${_searchController.playingList[0].results[_searchController.index].posterPath}'),
                width: 150),
            Wrap(
                direction: Axis.vertical,
                spacing: 20, // to apply margin in the main axis of the wrap
                runSpacing: 20, // to apply margin in the cross axis of the wrap
                children: <Widget>[
                  SizedBox(
                    child: Text(
                        '${_searchController.playingList[0].results[_searchController.index].title}'),
                    width: 200,
                  ),
                  Text(
                      '${_searchController.playingList[0].results[_searchController.index].releaseDate}'
                          .substring(0, 10)),
                  Text(
                      '${_searchController.playingList[0].results[_searchController.index].voteAverage}')
                ])
          ],
        ),
      ),
    );
  }
}
