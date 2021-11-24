import 'package:flutter/material.dart';
import 'package:sharedpreferences/models/data.dart';
import 'package:sharedpreferences/utils/snackbar.dart' as utils;

import 'package:sharedpreferences/utils/shared_pref.dart';

class RegisterController {
  BuildContext context;
  Function refresh;
  DataProfile dataProfile;
  bool isOnceCalled = false;

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController apellidocontroller = new TextEditingController();
  TextEditingController descripcioncontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController profesioncontroller = new TextEditingController();
  TextEditingController urlhvController = new TextEditingController();
  TextEditingController urlPhotocontroller = new TextEditingController();

  // shared preferences
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    if (!isOnceCalled) {
      isOnceCalled = true;
      dataProfileData();
    }
  }

  void register() async {
    String nombre = namecontroller.text.trim();
    String apellido = apellidocontroller.text.trim();
    String descripcion = descripcioncontroller.text.trim();
    String phone = phonecontroller.text.trim();
    String email = emailcontroller.text.trim();
    String profesion = profesioncontroller.text.trim();
    String urlhv = urlhvController.text.trim();
    String foto = urlPhotocontroller.text.trim();

    if (nombre.isEmpty ||
        apellido.isEmpty ||
        descripcion.isEmpty ||
        email.isEmpty ||
        profesion.isEmpty ||
        phone.isEmpty ||
        urlhv.isEmpty ||
        foto.isEmpty) {
      utils.Snackbar.showSnackbar(
          context, "Por favor completar todos los campos");

      return;
    }

    DataProfile dataProfiles = new DataProfile(
      nombre: nombre,
      apellido: apellido,
      descripcion: descripcion,
      email: email,
      telefono: phone,
      hvlink: urlhv,
      photolink: foto,
      profesion: profesion,
    );

    _sharedPref.saveData('profile', dataProfiles?.toJson());
    utils.Snackbar.showSnackbar(context, "Sus datos se guardaron con exito");
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  void dataProfileData() async {
    dataProfile = DataProfile.fromJson(await _sharedPref.read('profile') ?? {});

    namecontroller.text = dataProfile?.nombre;
    apellidocontroller.text = dataProfile?.apellido;
    descripcioncontroller.text = dataProfile?.descripcion;
    phonecontroller.text = dataProfile?.telefono;
    emailcontroller.text = dataProfile?.email;
    profesioncontroller.text = dataProfile?.profesion;
    urlhvController.text = dataProfile?.hvlink;
    urlPhotocontroller.text = dataProfile?.photolink;
    print("data ${dataProfile.toJson()}");

    refresh();
  }
}
