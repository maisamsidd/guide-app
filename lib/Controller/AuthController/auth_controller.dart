import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/VIews/Authentication/build_profile.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';
import 'package:guide_app/utils/Apis_utils.dart';

class AuthController extends GetxController {
  static void loginUser(
      String email, String password, BuildContext context) async {
    try {
      await ApisUtils.auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((onValue) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static void signUpUser(String email, String password, String confirmPassword,
      BuildContext context) async {
    try {
      if (password == confirmPassword) {
        await ApisUtils.auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((onValue) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpBuild(),
              ));
        });
      } else {
        Get.snackbar("Error", "Password doesn't match");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
