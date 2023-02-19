import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movie_app_flutter/models/playing_model.dart';

import 'api_info.dart';

class Controller extends GetxController {
  var playingList = <Playing>[].obs;
  var isLoading = true.obs;
  final apiInfo = ApiInfo();

  @override
  void onInit() {
    super.onInit();
    fetchPlayingData();
  }

  Future<void> fetchPlayingData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=${apiInfo.api_key}&language=en-US&page=1'));

    if (response.statusCode == 200) {
      Playing _playing = Playing.fromJson(jsonDecode(response.body));

      playingList.add(
        Playing(
            dates: _playing.dates,
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
