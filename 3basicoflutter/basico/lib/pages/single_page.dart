import 'package:flutter/material.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({Key key}) : super(key: key);

  @override
  _SinglePageState createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          miCard(),
          miCardImage(),
          miCardDesign(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
          miCardImageCarga(),
        ],
      ),
    ));
  }

  Card miCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Titulo'),
            subtitle: Text(
                'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
            leading: Icon(Icons.home),
          ),
        ],
      ),
    );
  }

  Card miCardImage() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage('assets/montana.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Montañas'),
          ),
        ],
      ),
    );
  }

  Card miCardImageCarga() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: AssetImage('assets/montana2.jpg'),
            placeholder: AssetImage('assets/loading.gif'),
            fit: BoxFit.cover,
            height: 260,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Paisaje con carga'),
          )
        ],
      ),
    );
  }

  Card miCardDesign() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      color: Color(0xFFE6EE9C),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
            title: Text('Titulo'),
            subtitle: Text(
                'Este es el subtitulo del card. Aqui podemos colocar descripción de este card.'),
            leading: Icon(Icons.home),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () => {}, child: Text('Aceptar')),
              FlatButton(onPressed: () => {}, child: Text('Cancelar'))
            ],
          )
        ],
      ),
    );
  }
}
