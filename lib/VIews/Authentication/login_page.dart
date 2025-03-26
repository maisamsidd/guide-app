import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:guide_app/Controller/AuthController/authController.dart';
import 'package:guide_app/VIews/Authentication/signup_page.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';
import 'package:guide_app/main.dart';
import 'package:guide_app/utils/app_colors.dart';
import 'package:guide_app/widgets/Buttons/ls_button.dart';
import 'package:guide_app/widgets/TextFields/login/ls_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    try {
      final response = await authService.signIn(
          emailController.text.trim(), passwordController.text.trim());

      if (response.user != null) {
        Get.offAll(() => const HomePage()); // Navigate after successful signup
      } else {
        Get.snackbar("Error", "Login failed");
      }
    } catch (e) {
      Get.snackbar("Error: ", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.orangeColor,
          title: Text("Login in",
              style: TextStyle(
                  color: MyColors.BlackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: MyColors.orangeColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: mq.height * 0.15,
              ),
              Center(
                child: Container(
                  height: mq.height * 0.4,
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
                        labelText: "Email",
                        controller: emailController,
                      ),
                      LsTextField(
                        labelText: "Password",
                        controller: passwordController,
                      ),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      LsButton(
                          text: "Login",
                          ontap: () async {
                            await login();
                          }),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Not a member?"),
                          TextButton(
                              onPressed: () => Get.to(() => const SignupPage()),
                              child: const Text(
                                "Create a free account",
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      )
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
