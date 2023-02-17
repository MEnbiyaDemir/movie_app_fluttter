import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movie_app_flutter/controller/login_controller.dart';
import 'package:movie_app_flutter/models/favoritelist_model.dart';
import 'package:movie_app_flutter/models/playing_model.dart';
import 'package:movie_app_flutter/models/profile_model.dart';

class ProfileController extends GetxController {


  var playingList = <ProfileModel>[].obs;
  var favList = <FavoriteModel>[].obs;
  var isLoading = true.obs;
  var adr1='https://api.themoviedb.org/3/account?api_key=';
  var api_key='c6bd8982f6e8aaa3c24cef0599a47755';
  var adr2='&session_id=';
  var sessionId=Get.find<LoginController>().sessionId;
  var accountId;

  var fav1='https://api.themoviedb.org/3/account/17172849';
  var fav2='/favorite/movies?api_key=c6bd8982f6e8aaa3c24cef0599a47755&session_id=';
  var fav3='&language=en-US&sort_by=created_at.asc&page=1';



  Future<void> fetchProfileData() async {
    print('${sessionId}');
    final response = await http.get(Uri.parse(adr1+api_key+adr2+sessionId));

    if (response.statusCode == 200) {
      ProfileModel _playing = ProfileModel.fromJson(jsonDecode(response.body));

      playingList.add(
        ProfileModel(avatar: _playing.avatar,
          id: _playing.id,
          includeAdult: _playing.includeAdult,
          username: _playing.username)
      );


      this.accountId=_playing.id;
      print('acc id:'+'${accountId}');

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

  Future<void> fetchFavoriteData() async {
    await fetchProfileData();

    final response = await http.get(Uri.parse(fav1+fav2+sessionId+fav3));

    if (response.statusCode == 200) {
      FavoriteModel _fav = FavoriteModel.fromJson(jsonDecode(response.body));

      favList.add(
          FavoriteModel(
            page: _fav.page,
            results: _fav.results,
            totalPages: _fav.totalPages,
            totalResults: _fav.totalResults,
          )
      );

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

}
