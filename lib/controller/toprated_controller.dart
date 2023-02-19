import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movie_app_flutter/models/toprated_model.dart';

import 'api_info.dart';

class TopratedController extends GetxController {
  var playingList = <Toprated>[].obs;
  var isLoading = true.obs;
  final apiinfo = ApiInfo();

  @override
  void onInit() {
    super.onInit();
    fetchTopratedData();
  }

  Future<void> fetchTopratedData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=${apiinfo.api_key}&language=en-US&page=1'));

    if (response.statusCode == 200) {
      Toprated _playing = Toprated.fromJson(jsonDecode(response.body));

      playingList.add(
        Toprated(
            page: _playing.page,
            results: _playing.results,
            totalPages: _playing.totalPages,
            totalResults: _playing.totalResults),
      );

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
