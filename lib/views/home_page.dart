import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_flutter/style/styles.dart';
import 'package:movie_app_flutter/widgets/bottombar_widget.dart';
import 'package:movie_app_flutter/widgets/upcoming_widget.dart';
import 'package:movie_app_flutter/widgets/nowplaying_widget.dart';
import 'package:movie_app_flutter/widgets/toprated_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("MovieLog")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("PLAYING", style: GoogleFonts.concertOne(fontSize: 40)),
            Playing(),
            Text("UPCOMING", style: GoogleFonts.concertOne(fontSize: 40)),
            Upcoming(),
            Text("TOPRATED", style: GoogleFonts.concertOne(fontSize: 40)),
            TopRated(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
