import 'package:flutter/material.dart';
import 'package:sharedpreferences/constants/constants.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key key}) : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Nombre de usuario",
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
                Container(
                  child: Text(
                    "Correo electronico",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/usuario1.png'),
                    radius: 40,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(color: azul),
          ),
          ListTile(
            title: Text("Mi Perfil"),
            // leading para colocar el icono a la izquierda
            trailing: Icon(Icons.edit),
            onTap: () {},
          ),

          // botones para el dark mode
        ],
      ),
    );
  }
}
