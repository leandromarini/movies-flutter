import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/constants.dart';
import 'core/theme_app.dart';
import 'pages/movie_page.dart';
import 'package:custom_splash/custom_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(new MyApp());
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
        backGroundColor: kThemeApp.backgroundColor,
        duration: 3000,
        home: MoviePage(),
      ),
    );
  }
}
