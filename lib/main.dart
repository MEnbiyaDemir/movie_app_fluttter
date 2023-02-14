import 'package:flutter/material.dart';
import 'package:movieapi_flutter/views/home_page.dart';
import 'package:movieapi_flutter/views/movie_page.dart';
import 'package:movieapi_flutter/views/search_page.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}
