import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:internediowidget/controllers/map_controller.dart';
import 'package:internediowidget/widgets/menu.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  MapController _con = new MapController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('¿Estas seguro?'),
            content: new Text('Realmente quieres salir de la aplicacion'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: new Text('Si'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: key,
        drawer: MenuButton(),
        body: Stack(
          children: [
            _googleMapsWidget(),
            SafeArea(
              child: Column(
                children: [
                  _btnMenuDrawer(),
                  _cardGooglePlaceS(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _btnChangeTo(),
                      _btnCenterPosition(),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: _iconMyLocation(),
            )
          ],
        ),
      ),
    );
  }

  Widget _btnMenuDrawer() {
    return Container(
      alignment: Alignment.centerLeft,
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

  Widget _btnCenterPosition() {
    return GestureDetector(
      onTap: _con.centerPosition,
      child: Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Card(
          shape: CircleBorder(),
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.location_searching,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }

  // boton para cambiar al destino
  Widget _btnChangeTo() {
    return GestureDetector(
      onTap: _con.changeFromTo,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Card(
          shape: CircleBorder(),
          elevation: 5.0,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.switch_account,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }

  Widget _googleMapsWidget() {
    return GoogleMap(
      initialCameraPosition: _con.initialPosition,
      onMapCreated: _con.onMapCreated,
      myLocationEnabled: false,
      myLocationButtonEnabled: false,
      markers: Set<Marker>.of(_con.markers.values),
      onCameraMove: (position) {
        _con.initialPosition = position;
      },
      onCameraIdle: () async {
        await _con.setLocationDraggableInfo();
      },
    );
  }

  // icono
  Widget _iconMyLocation() {
    return Image.asset("assets/rapidfasmarker.png", width: 55, height: 55);
  }

  // carview
  Widget _cardGooglePlaceS() {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoCardLocation(
                  "Origen",
                  _con.from ?? "Lugar de Recogida",
                  () async {
                    await _con.showGoogleAutoComplete(true);
                  },
                  _buscarAutocomplete(
                    () async {
                      await _con.showGoogleAutoComplete(true);
                    },
                  ),
                ),
                SizedBox(height: 5),
                Container(
                    width: double.infinity,
                    child: Divider(color: Colors.grey, height: 10)),
                SizedBox(height: 5),
                _infoCardLocation(
                  "Destino",
                  _con.to ?? "Lugar de Destino",
                  () async {
                    await _con.showGoogleAutoComplete(false);
                  },
                  _buscarAutocomplete(
                    () async {
                      await _con.showGoogleAutoComplete(false);
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _infoCardLocation(
      String title, String value, Function function, Widget widget) {
    return GestureDetector(
      onTap: function,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                ),
              ),
              widget,
            ],
          ),
          GestureDetector(
            onTap: function,
            child: Text(
              value.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  // boton para grabar audio del destino
  Widget _buscarAutocomplete(Function function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.centerRight,
        child: Card(
          shape: CircleBorder(),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
