import 'package:flutter/material.dart';
import 'package:sharedpreferences/models/data.dart';
import 'package:sharedpreferences/utils/shared_pref.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController {
  BuildContext context;
  Function refresh;
  DataProfile dataProfile;
  bool isCalledOnce = false;

  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  // shared preferences
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    if (!isCalledOnce) {
      isCalledOnce = true;
      dataProfileData();
    }

    print(" data ${dataProfile?.nombre}");
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  void dataProfileData() async {
    dataProfile = DataProfile.fromJson(await _sharedPref.read('profile') ?? {});
    print("data ${dataProfile.toJson()}");

    refresh();
  }

  void launchURL() async {
    String url = dataProfile?.hvlink ?? "https://jdvpl.com/";
    await launch(url);
  }

  void launchPhoto() async {
    String url = dataProfile?.photolink ??
        "https://jdvpl.com/static/assets/img/profile-img.jpg";
    await launch(url);
  }
}
