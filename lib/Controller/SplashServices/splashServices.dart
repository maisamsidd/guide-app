import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guide_app/Authentication/login_page.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';

class Splashservices {
  void splashServices(BuildContext context) async {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }
}
