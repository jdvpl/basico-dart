import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sharedpreferences/constants/constants.dart';
import 'package:sharedpreferences/controllers/profile_controller.dart';
import 'package:sharedpreferences/utils/responsive.dart';
import 'package:sharedpreferences/widgets/menu.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController _con = new ProfileController();
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
    final Responsive responsive = Responsive.of(context);

    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        title: Text("Mi perfil"),
        leading: _btnMenuDrawer(),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            tooltip: 'Editar perfil',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, "home", (route) => false);
            },
          ),
        ],
        backgroundColor: Colors.deepOrange[900],
      ),
      drawer: MenuButton(),
      backgroundColor: Colors.orange[100],
      body: SingleChildScrollView(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
              child: Column(
                children: [
                  Container(
                    color: Colors.deepOrange[900],
                    height: responsive.hp(100),
                    width: responsive.wp(30),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Hoja de vida",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: white,
                                        fontSize: responsive.dp(2.2),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _con.dataProfile?.profesion ?? "Profesion",
                                    style: TextStyle(
                                      color: white,
                                      fontSize: responsive.wp(2.3),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: responsive.hp(30),
                            ),
                            Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "CONTÁCTAME",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: white,
                                        fontSize: responsive.dp(1.5),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.location_on_rounded,
                                    color: white,
                                    size: 35,
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.hp(3),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: responsive.dp(1.3),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _con.dataProfile?.email ??
                                        "Correo@correo.com",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: responsive.wp(2),
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Telefono",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: responsive.dp(1.3),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.hp(1),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    _con.dataProfile?.telefono ?? "3213627615",
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: responsive.dp(1.3),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: responsive.hp(8),
                                ),
                                GestureDetector(
                                  onTap: _con.launchURL,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Ver hoja de vida",
                                      style: TextStyle(
                                        color: white,
                                        fontSize: responsive.dp(1.3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: responsive.hp(10),
                          right: -responsive.wp(5),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: GestureDetector(
                              onTap: _con.launchPhoto,
                              child: Container(
                                padding: EdgeInsets.all(responsive.dp(0.6)),
                                width: responsive.wp(40),
                                height: responsive.hp(25),
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.orange[100],
                                  border: new Border.all(
                                    color: Colors.deepOrange[900],
                                    width: 1.5,
                                  ),
                                ),
                                child: CircleAvatar(
                                  backgroundImage:
                                      _con.dataProfile?.photolink != null
                                          ? NetworkImage(
                                              _con.dataProfile?.photolink)
                                          : AssetImage('assets/usuario1.png'),
                                  radius: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: responsive.hp(15),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                _con.dataProfile?.apellido ?? "Apellido",
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: responsive.dp(2.6),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                (_con.dataProfile?.nombre ?? "Nombre")
                                    .toUpperCase(),
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: responsive.wp(7.0),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: responsive.hp(6.5),
                            ),
                            Container(
                              child: Text(
                                _con.dataProfile?.descripcion ??
                                    "Hello! My name is Juan Daniel Suarez, and I'm a Bogotá based freelancer. if I am not freelancing at some of Bogotá's finest digital agencies, I'm working remotely on projects for clients all over the world.\n\nI am currently working with MinTIC and 'Canal 13' agreement and I'm also creating my micro-business, I am developing an app for taxi drivers, individuals, motorcycles with electronic payments called Rapid Fast, which will go into production in November. I really love programming and know all about Technology.",
                                style: TextStyle(
                                  color: Colors.green[900],
                                  fontSize: responsive.dp(1.5),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnMenuDrawer() {
    return Container(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: _con.openDrawer,
        icon: Icon(
          Icons.menu,
          color: white,
          size: 35,
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
