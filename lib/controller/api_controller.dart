import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movieapi_flutter/models/playing_model.dart';

class Controller extends GetxController {
  var playingList = <Playing>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPlayingData();
  }

  Future<void> fetchPlayingData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=c6bd8982f6e8aaa3c24cef0599a47755&language=en-US&page=1'));

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
