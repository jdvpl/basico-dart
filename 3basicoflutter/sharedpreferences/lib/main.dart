import 'package:flutter/material.dart';
import 'package:sharedpreferences/pages/home_page.dart';
import 'package:sharedpreferences/pages/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.red,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => RegisterPage(),
        "profile": (context) => ProfilePage(),
      },
    );
  }
}
