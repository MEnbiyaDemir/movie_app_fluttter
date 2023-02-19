import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/api_info.dart';
import 'package:movie_app_flutter/models/search_model.dart';

class SearchController extends GetxController {
  final textController = TextEditingController();
  var index;
  var playingList = <Search>[].obs;
  var isLoading = true.obs;
  final apiinfo = ApiInfo();
  late var api_key = apiinfo.api_key;

  String url1 =
      'https://api.themoviedb.org/3/search/movie?api_key=c6bd8982f6e8aaa3c24cef0599a47755&language=en-US&query=';
  String search = 'q';
  String url2 = '&page=1&include_adult=false';

  Future<void> fetchSearchData() async {
    print("!!!!!!text${textController.text}!!!!!");
    print("!!!!!!search${search}!!!!!");
    final response = await http.get(Uri.parse(url1 + search + url2));

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
      search = search.substring(search.length - 1);
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
