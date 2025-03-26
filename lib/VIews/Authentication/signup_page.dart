import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/Controller/AuthController/authController.dart';
import 'package:guide_app/VIews/Authentication/login_page.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';
import 'package:guide_app/main.dart';
import 'package:guide_app/utils/app_colors.dart';
import 'package:guide_app/widgets/Buttons/ls_button.dart';
import 'package:guide_app/widgets/TextFields/login/ls_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  Future<void> signup() async {
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      Get.snackbar("Error: ", "Passwords do not match");
      return;
    }
    try {
      final response = await authService.signUp(
          emailController.text.trim(), passwordController.text.trim());

      if (response.user != null) {
        Get.offAll(() => const HomePage()); // Navigate after successful signup
      } else {
        Get.snackbar("Error", "Sign-up failed");
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
                          ontap: () async {
                            await signup();
                          }),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already a member?"),
                          TextButton(
                              onPressed: () => Get.to(() => const LoginPage()),
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
