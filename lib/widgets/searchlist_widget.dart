import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/search_controller.dart';
import 'package:movie_app_flutter/widgets/moviecard_widget.dart';

class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  final SearchController _searchController = Get.put(SearchController());
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                  color: Colors.blueAccent,
                  width: 4.0,
                  style: BorderStyle.solid)),
          child: TextField(
            onChanged: (text) {
              setState(() {
                _searchController.playingList.clear();
                _searchController.url2 = _searchController.textController.text;
                _searchController.fetchSearchData();
              });
            },
            controller: _searchController.textController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: "Search...",
            ),
          ),
        ),
        FutureBuilder(
            future: _searchController.fetchSearchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  padding: EdgeInsetsDirectional.only(top: 10),
                  height: 550.0,
                  child: ListView.builder(
                    reverse: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(8),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      _searchController.index = index;
                      return MovieCard();
                    },
                  ),
                );
              } else {
                return SizedBox(
                  width: 220,
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ],
    );
  }
}
