import 'package:flutter/material.dart';
import 'package:internediowidget/widgets/menu.dart';

class AnimatedPage extends StatefulWidget {
  AnimatedPage({Key key}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: MenuButton(),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Column(
          children: [
            _btnMenuDrawer(20),
            Center(
              child: AnimatedContainer(
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
                color: selected ? Colors.black : Colors.teal,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: const FlutterLogo(size: 75),
              ),
            ),
          ],
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
}
