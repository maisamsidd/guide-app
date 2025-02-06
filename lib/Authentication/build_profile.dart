import 'package:flutter/material.dart';

import '../../main.dart';
import '../utils/app_colors.dart';
import '../widgets/Buttons/profile_build_button.dart';
import '../widgets/TextFields/login/profile_build_textfield.dart';

class SignUpBuild extends StatelessWidget {
  const SignUpBuild({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.greyColor,
        body: Center(
          child: Column(
            children: [
              Container(
                height: 70,
                width: mq.width * 100,
                color: MyColors.whiteColor,
                child: const Center(
                  child: Text(
                    "Add a profile",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: mq.height * 0.15,
              ),
              Container(
                width: mq.width * 0.85,
                height: mq.height * 0.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfileBuildTextfield(
                      hintText: "John Doe",
                      labelText: "Full name",
                    ),
                    const ProfileBuildTextfield(
                      hintText: "e.g Diabetes",
                      labelText: "Condition",
                    ),
                    const ProfileBuildTextfield(
                      hintText: "Age",
                      labelText: "24",
                    ),
                    SizedBox(
                      height: mq.height * 0.06,
                    ),
                    const ProfileBuildButton()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
