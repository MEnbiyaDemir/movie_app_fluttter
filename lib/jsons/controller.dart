import 'package:get/get.dart';
import 'package:movieapi_flutter/controller/api_controller.dart';
import 'package:movieapi_flutter/models/movie_model.dart';
import 'package:movieapi_flutter/controller/api_controller.dart';
import '../models/playing_model.dart';

class Controllerf{

  var upcominglist= <Movie>[
    Movie(true, {15:'action',20:'romantic'}, 55, "homecoming", "lofsdfs", 3456, "playing", 'https://picsum.photos/250?image=12', "release_date", "language", 20.0),
    Movie(false, {15:'action',20:'romantic'}, 44, "zartcoming", "lorea", 5434, "playing", 'https://picsum.photos/250?image=9', "releasggdfgasde_date", "langggguage", 10.0),
    Movie(true, {15:'action',20:'romantic'}, 78, "3.coming", "loresadflabla", 3243, "playing", 'https://picsum.photos/250?image=11', "rdfsafe", "fsdf", 30.0)
  ].obs;

  var playinglist= <Result>[].obs;
  var topratedlist= <Movie>[].obs;


}