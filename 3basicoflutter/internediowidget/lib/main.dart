import 'package:flutter/material.dart';
import 'package:internediowidget/pages/home_page.dart';
import 'package:internediowidget/pages/register_page.dart';

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
        primarySwatch: Colors.blue,
      ),
      initialRoute: "home",
      routes: {
        "home": (context) => HomePage(),
        "register": (context) => RegisterPage(),
      },
    );
  }
}
