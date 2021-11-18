import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:sharedpreferences/constants/constants.dart';
import 'package:sharedpreferences/controllers/register_controller.dart';
import 'package:sharedpreferences/widgets/button_app.dart';
import 'package:sharedpreferences/widgets/menu.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController _con = new RegisterController();

  @override
  void initState() {
    super.initState();
    // con este metodo podemos isntanaciar depues de que cargue la app
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      drawer: MenuButton(),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _bannerApp(),
            _txtRegistro(),
            _textField("NOMBRE", 1, TextInputType.text, _con.namecontroller,
                Icons.person),
            _textField("APELLIDOS", 1, TextInputType.text,
                _con.apellidocontroller, Icons.person_outlined),
            _textField("DESCRIPCION PERSONAL", 3, TextInputType.text,
                _con.descripcioncontroller, Icons.description),
            _textField("EMAIL", 1, TextInputType.emailAddress,
                _con.emailcontroller, Icons.description),
            _textField("TELEFONO", 1, TextInputType.phone, _con.phonecontroller,
                Icons.phone_android_rounded),
            _textField("LINK DE HV", 1, TextInputType.url, _con.urlhvController,
                Icons.desktop_windows_sharp),
            _textField("LINK DE FOTO", 1, TextInputType.url,
                _con.urlPhotocontroller, Icons.image),
            _buttonRegister(),
          ],
        ),
      ),
    );
  }

//  banner
  Widget _bannerApp() {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: azul,
        //indicando que es el 30% de la pantalla
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: [
            _btnMenuDrawer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Image.asset(
                    'assets/logo.png',
                    width: MediaQuery.of(context).size.width * .35,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03),
                  child: Text(
                    'Personal Soft',
                    style: TextStyle(
                        fontSize: 22,
                        color: white,
                        fontWeight: FontWeight.normal),
                    maxLines: 2,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  //texto de inicio de sesion
  Widget _txtRegistro() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'Registra tus datos',
        style:
            TextStyle(color: black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }

//  input del nombre
  Widget _textField(String name, int maxlines, TextInputType type,
      TextEditingController controller, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        controller: controller,
        style: TextStyle(color: black),
        maxLines: maxlines,
        decoration: InputDecoration(
          labelText: name,
          hintText: name,
          hintStyle: TextStyle(color: black),
          labelStyle: TextStyle(color: black),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: black),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: black)),
          suffixIcon: Icon(icon),
        ),
        keyboardType: type,
      ),
    );
  }

  Widget _buttonRegister() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: ButtonApp(
          onPressed: _con.register,
          text: "Guardar Datos",
        ));
  }

  Widget _btnMenuDrawer() {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015),
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: _con.openDrawer,
        icon: Icon(
          Icons.menu,
          color: black,
          size: 35,
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
