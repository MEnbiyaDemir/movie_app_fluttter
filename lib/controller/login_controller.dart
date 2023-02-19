import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:movie_app_flutter/models/playing_model.dart';
import 'package:movie_app_flutter/views/RootPage.dart';
import 'package:movie_app_flutter/views/home_page.dart';
import '../models/login_model.dart';
import '../models/loginresult_model.dart';
import '../models/reqtoken_model.dart';
import 'api_info.dart';

class LoginController extends GetxController {
  final mailController = TextEditingController();
  final passController = TextEditingController();
  var playingList = <ReqToken>[].obs;
  var isLoading = true.obs;
  var sessionId;
  var succes;
  final apiInfo = ApiInfo();

  Future<LoginModel?> sessionCall() async {
    if (await loginCall() == true) {
      final responsed = await http.post(
          Uri.parse(
              'https://api.themoviedb.org/3/authentication/session/new?api_key=${apiInfo.api_key}'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8'
          },
          body: jsonEncode(<String, String>{
            "request_token":
                '${playingList[playingList.length - 1].requestToken}'
          }));
      if (responsed.statusCode == 200) {
        var result = LoginModel.fromJson(jsonDecode(responsed.body));

        this.sessionId = result.sessionId;
        print('succes:' + '${result.success}');
        print('statuscode:' + '${result.statusCode}');
        print('sessionId:' + '${result.sessionId}');
        print('sessionId controller:' + '${sessionId}');
        print('failure:' + '${result.failure}');

        Get.to(RootPage());
        return result;
      } else {
        Get.snackbar('Login Failed!',
            'Sever responded: ${responsed.statusCode}:${responsed.reasonPhrase.toString()}');
        refresh();
      }
    } else {
      Get.snackbar('Login Failed', 'Wrong password or username');
      refresh();
    }
  }

  Future<bool> loginCall() async {
    await fetchreqtokenData();

    print('mail::' + '${mailController.text}');
    print('pass:' + '${passController.text}');
    print('reqtoken:' + '${playingList[playingList.length - 1].requestToken}');
    final responsed = await http.post(
        Uri.parse(
            'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=${apiInfo.api_key}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{
            "username": mailController.text,
            "password": passController.text,
            "request_token": playingList[playingList.length - 1].requestToken
          },
        ));
    if (responsed.statusCode == 200) {
      var result = LoginResultModel.fromJson(jsonDecode(responsed.body));
      print('succes:' + '${result.success}');
      print('expiresAt:' + '${result.expiresAt}');
      print('reqToken:' + '${result.requestToken}');
      return true;
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${responsed.statusCode}:${responsed.reasonPhrase.toString()}');
      return false;
    }
  }

  Future<void> fetchreqtokenData() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key=c6bd8982f6e8aaa3c24cef0599a47755'));

    if (response.statusCode == 200) {
      ReqToken _playing = ReqToken.fromJson(jsonDecode(response.body));

      playingList.add(ReqToken(
          success: _playing.success,
          expiresAt: _playing.expiresAt,
          requestToken: _playing.requestToken));

      print('${playingList[playingList.length - 1].requestToken}');

      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
