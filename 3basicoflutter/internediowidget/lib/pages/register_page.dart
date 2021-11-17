import 'package:internediowidget/utils/responsive.dart';
import 'package:internediowidget/widgets/circle.dart';
import 'package:internediowidget/widgets/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:internediowidget/widgets/menu.dart';
import 'package:internediowidget/widgets/register_form.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // clase responsive
    final Responsive responsive = Responsive.of(context);
    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);

    return Scaffold(
      key: key,
      drawer: MenuButton(),
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
                      Colors.black,
                      Colors.black87,
                    ],
                  ),
                ),
                Positioned(
                  top: -orangeSize * .55,
                  left: -orangeSize * .15,
                  child: Circle(
                    size: orangeSize,
                    colors: [
                      Colors.black54,
                      Colors.black26,
                    ],
                  ),
                ),
                Positioned(
                  top: pinkSize * 0.37,
                  child: Column(
                    children: [
                      _lottieAnimation(),
                      SizedBox(
                        height: responsive.hp(3),
                      ),
                      Text(
                        "Registrate Gratis",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: responsive.dp(2)),
                      )
                    ],
                  ),
                ),
                RegisterForm(),
                _btnMenuDrawer(responsive.hp(2)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _btnMenuDrawer(double top) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(top: top),
      child: IconButton(
        onPressed: () {
          key.currentState.openDrawer();
        },
        icon: Icon(
          Icons.menu,
          size: 30.0,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _lottieAnimation() {
    return Lottie.asset("assets/register.json",
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.15,
        fit: BoxFit.fill);
  }
}
