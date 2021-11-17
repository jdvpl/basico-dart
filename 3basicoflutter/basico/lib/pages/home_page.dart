import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_circle_down_outlined),
              Text("Haz click sobre cada card"),
            ],
          ),
          _cardViews(
              "Scrolling ListView",
              "ListView es el widget de desplazamiento más utilizado. Muestra sus hijos uno tras otro en la dirección de desplazamiento. En el eje transversal, se requiere que los hijos llenen el ListView. Como podemos ver hace scroll hasta el ultimo elemento",
              "single"),
          _cardViews(
              "Input FormField",
              "Se construyo un formulario de login. Este widget mantiene el estado actual del campo del formulario, de modo que las actualizaciones y los errores de validación se reflejan visualmente en la interfaz de usuario ",
              "login"),
          _cardViews(
              "Layout GridView",
              "Los diseños de cuadrícula más utilizados son GridView.count , que crea un diseño con un número fijo de mosaicos en el eje transversal, y GridView.extent , que crea un diseño con mosaicos que tienen una extensión máxima de eje transversal. Un SliverGridDelegate personalizado puede producir un arreglo 2D arbitrario de elementos secundarios , incluidos arreglos que no están alineados o se superponen.",
              "grid"),
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
              title: Text(
                texto,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
