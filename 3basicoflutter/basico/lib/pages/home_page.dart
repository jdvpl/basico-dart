import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _cardViews(
              "ListView",
              "ListView es el widget de desplazamiento más utilizado. Muestra sus hijos uno tras otro en la dirección de desplazamiento. En el eje transversal, se requiere que los niños llenen el ListView.",
              "single"),
          _cardViews(
              "Single ScrollView",
              "Este widget es útil cuando tiene un solo cuadro que normalmente será completamente visible, por ejemplo, una esfera de reloj en un selector de tiempo, pero debe asegurarse de que se pueda desplazar si el contenedor se vuelve demasiado pequeño en un eje (la dirección de desplazamiento ",
              "single"),
          Expanded(child: Container()),
          _bannerdown()
        ],
      )),
    );
  }

  Widget _cardViews(String texto, String content, String goto) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, goto);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(20),
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(15),

              // ignore: unnecessary_new
              title: Text(texto),
              subtitle: Text(content),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bannerdown() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          color: Colors.black12,
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Icon(
                    Icons.phone,
                    size: 30,
                  ),
                  Text(
                    "CALL",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.directions,
                    size: 30,
                    color: Colors.cyan,
                  ),
                  Text(
                    "ROUTE",
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.share,
                    size: 30,
                    color: Colors.cyan,
                  ),
                  Text(
                    "SHARE",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
