import 'package:basico/utils/responsive.dart';
import 'package:basico/widgets/circle.dart';
import 'package:basico/widgets/icon_container.dart';
import 'package:basico/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // clase responsive
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.height,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -pinkSize * .4,
                  right: -pinkSize * .2,
                  child: Circle(
                    size: pinkSize,
                    colors: [
                      Colors.pinkAccent,
                      Colors.pink,
                    ],
                  ),
                ),
                Positioned(
                  top: -orangeSize * .55,
                  left: -orangeSize * .15,
                  child: Circle(
                    size: orangeSize,
                    colors: [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                    ],
                  ),
                ),
                Positioned(
                  top: pinkSize * 0.37,
                  child: Column(
                    children: [
                      IconContainer(size: responsive.wp(17)),
                      SizedBox(
                        height: responsive.hp(3),
                      ),
                      Text(
                        "Hola\nBienvenido!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: responsive.dp(2)),
                      )
                    ],
                  ),
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
