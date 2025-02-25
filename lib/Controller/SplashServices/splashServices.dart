import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_app/VIews/Authentication/login_page.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';

class Splashservices {
  final auth = FirebaseAuth.instance;

  void splashServices(BuildContext context) async {
    final currentUser = auth.currentUser;
    try {
      if (currentUser != null) {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error")),
      );
    }
  }
}
