import 'package:basico/pages/gridview_page.dart';
import 'package:basico/pages/home_page.dart';
import 'package:basico/pages/login_page.dart';
import 'package:basico/pages/single_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes: {
        'home': (context) => const HomePage(),
        'single': (context) => SinglePage(),
        'login': (context) => LoginPage(),
        'grid': (context) => GridViewPage(),
      },
    );
  }
}
