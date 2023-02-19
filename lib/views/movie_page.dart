import 'package:flutter/material.dart';
import 'package:movie_app_flutter/controller/search_controller.dart';
import 'package:movie_app_flutter/widgets/bottombar_widget.dart';
import 'package:movie_app_flutter/widgets/moviecard_widget.dart';
import 'package:get/get.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SearchController _searchController = Get.put(SearchController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        title: Center(child: Text("MovieLog")),
      ),
      body: Column(
        children: [
          MovieCard(),
          Text("SUMMARY"),
          Container(
            width: 400,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    color: Colors.black38,
                    width: 6.0,
                    style: BorderStyle.solid)),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.wavy,
                  fontSize: 17,
                ),
                text:
                    '${_searchController.playingList[0].results[_searchController.index].overview}',
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }
}
