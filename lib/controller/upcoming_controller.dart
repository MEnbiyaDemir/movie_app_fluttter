import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../models/upcoming_model.dart';
import 'api_info.dart';

class UpcomingController extends GetxController {
  var playingList = <Upcoming>[].obs;
  var isLoading = true.obs;
  final apiinfo = ApiInfo();

  @override
  void onInit() {
    super.onInit();
    fetchUpcomingData();
  }

  Future<void> fetchUpcomingData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=${apiinfo.api_key}&language=en-US&page=1'));

    if (response.statusCode == 200) {
      Upcoming _playing = Upcoming.fromJson(jsonDecode(response.body));

      playingList.add(
        Upcoming(
            page: _playing.page,
            results: _playing.results,
            totalPages: _playing.totalPages,
            totalResults: _playing.totalResults,
            dates: _playing.dates),
      );

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
