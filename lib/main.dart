import 'package:flutter/material.dart';
import 'package:instarich/screens/HomeScreen/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: false
          ? ThemeData(
              backgroundColor: Color(0xFFEDEFF5),
              primaryColor: Colors.black,
              primaryColorDark: Colors.white,
              cardColor: Colors.white,
              appBarTheme: AppBarTheme(
                foregroundColor: Colors.black,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
                color: Colors.black,
                actionsIconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomAppBarColor: Colors.white,
            )
          : ThemeData(
              backgroundColor: Colors.black,
              primaryColor: Colors.white,
              primaryColorDark: Colors.black,
              cardColor: Color(0xFF32323B),
              appBarTheme: const AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
                color: Colors.black,
                actionsIconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomAppBarColor: Colors.black),
      home: HomeScreen(
        key: key,
      ),
    );
  }
}
