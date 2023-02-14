import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movieapi_flutter/models/search_model.dart';

class SearchController extends GetxController {
  final textController = TextEditingController();
  var index;
  var playingList = <Search>[].obs;
  var isLoading = true.obs;
  var url =
      'https://api.themoviedb.org/3/search/movie?api_key=c6bd8982f6e8aaa3c24cef0599a47755&language=en-US&query=you&page=1&include_adult=false';
  var url1 =
      'https://api.themoviedb.org/3/search/movie?api_key=c6bd8982f6e8aaa3c24cef0599a47755&language=en-US&query=';
  var url2 = 'a';
  var url3 = '&page=1&include_adult=false';

  Future<void> fetchSearchData() async {
    print("!!!!!!${textController.text}!!!!!");
    print("!!!!!!${url2}!!!!!");
    final response = await http.get(Uri.parse(url1 + url2 + url3));

    if (response.statusCode == 200) {
      Search _search = Search.fromJson(jsonDecode(response.body));

      playingList.add(
        Search(
            page: _search.page,
            results: _search.results,
            totalPages: _search.totalPages,
            totalResults: _search.totalResults),
      );

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
