import 'package:flutter/material.dart';
import 'package:movie_app_flutter/views/home_page.dart';
import 'package:movie_app_flutter/widgets/searchlist_widget.dart';
import 'package:movie_app_flutter/widgets/bottombar_widget.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  gotonext() {
    Get.to(HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("Advanced Search")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [SearchList()],
        ),
      ),
      //bottomNavigationBar: BottomBar(),
    );
  }
}
