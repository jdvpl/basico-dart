import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:sharedpreferences/models/data.dart';
import 'package:sharedpreferences/utils/snackbar.dart' as utils;

import 'package:sharedpreferences/utils/shared_pref.dart';

class RegisterController {
  BuildContext context;
  Function refresh;
  ProgressDialog _progressDialog;

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController apellidocontroller = new TextEditingController();
  TextEditingController descripcioncontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController urlhvController = new TextEditingController();
  TextEditingController urlPhotocontroller = new TextEditingController();

  // shared preferences
  SharedPref _sharedPref;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
  }

  void register() async {
    String nombre = namecontroller.text.trim();
    String apellido = apellidocontroller.text.trim();
    String descripcion = descripcioncontroller.text.trim();
    String phone = phonecontroller.text.trim();
    String email = emailcontroller.text.trim();
    String urlhv = urlhvController.text.trim();
    String foto = urlPhotocontroller.text.trim();

    if (nombre.isEmpty ||
        apellido.isEmpty ||
        descripcion.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        urlhv.isEmpty ||
        foto.isEmpty) {
      utils.Snackbar.showSnackbar(
          context, "Por favor completar todos los campos");

      return;
    }

    DataProfile dataProfile = new DataProfile(
        nombre: nombre,
        apellido: apellido,
        descripcion: descripcion,
        email: email,
        telefono: phone,
        hvlink: urlhv,
        photolink: foto);
    _sharedPref.saveData('calification', dataProfile?.toJson());
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }
}
