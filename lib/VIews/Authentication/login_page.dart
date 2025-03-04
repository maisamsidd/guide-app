import 'package:flutter/material.dart';
import 'package:guide_app/Controller/AuthController/auth_controller.dart';
import '../../main.dart';
import '../../utils/app_colors.dart';
import '../../widgets/Buttons/ls_button.dart';
import '../../widgets/TextFields/login/ls_textfield.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

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
                          ontap: () {
                            setState(() {
                              AuthController.loginUser(emailController.text,
                                  passwordController.text, context);
                            });
                          }),
                      SizedBox(
                        height: mq.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Not a member?"),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupPage()));
                              },
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
