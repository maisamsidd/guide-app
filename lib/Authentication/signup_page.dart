import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:guide_app/Authentication/build_profile.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';

import '../main.dart';
import '../utils/app_colors.dart';
import '../widgets/Buttons/ls_button.dart';
import '../widgets/TextFields/login/ls_textfield.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();
final auth = FirebaseAuth.instance;

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.orangeColor,
          title: Text("Sign up",
              style: TextStyle(
                  color: MyColors.BlackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: MyColors.orangeColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: mq.height * 0.1,
              ),
              Center(
                child: Container(
                  height: mq.height * 0.55,
                  width: mq.width * 0.9,
                  decoration: BoxDecoration(
                      color: MyColors.whiteColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: mq.height * 0.05,
                      ),
                      LsTextField(
                        hintText: "abc@example.com",
                        controller: emailController,
                        labelText: "Email",
                      ),
                      LsTextField(
                        labelText: "Password",
                        controller: passwordController,
                      ),
                      LsTextField(
                        labelText: "Confirm password",
                        controller: confirmPasswordController,
                      ),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      LsButton(
                        text: "Sign Up",
                        ontap: () {
                          try {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              auth
                                  .createUserWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text)
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
                        },
                      ),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already a member?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              child: const Text(
                                "Back to log in",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
