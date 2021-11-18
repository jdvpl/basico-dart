import 'package:flutter/material.dart';
import 'package:sharedpreferences/constants/constants.dart';

// ignore: must_be_immutable
class ButtonApp extends StatelessWidget {
  Color buttonColor;
  String text;
  Color textColor;

  Color bgColor;
  Function onPressed;
  //simikar a react
  ButtonApp(
      {this.buttonColor = azul,
      @required this.text,
      this.textColor = white,
      this.bgColor = white,
      this.onPressed});
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      onPressed: () {
        onPressed();
      },
      color: buttonColor,
      textColor: textColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      //redondear el boton
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
