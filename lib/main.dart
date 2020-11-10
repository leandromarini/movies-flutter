import 'package:flutter/material.dart';
import 'core/constants.dart';
import 'core/theme_app.dart';
import 'pages/movie_page.dart';
import 'package:custom_splash/custom_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: kThemeApp,
      home: CustomSplash(
        imagePath: 'assets/images/splash_screen.png',
        backGroundColor: Colors.black,
        duration: 3000,
        home: MoviePage(),
      ),
    );
  }
}
