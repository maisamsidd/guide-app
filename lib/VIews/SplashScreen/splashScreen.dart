import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/Controller/AuthController/auth_gateway.dart';
import 'package:guide_app/main.dart';
import 'package:guide_app/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Wait for 3 seconds then navigate to AuthGateway
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const AuthGateway()); // Removes SplashScreen from stack
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColors.whiteColor,
      body: Center(
        child: Image.asset("assets/images/logo.png"),

        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Text(
        //       "Get Your Guide",
        //       style: TextStyle(
        //           fontSize: 50,
        //           fontWeight: FontWeight.bold,
        //           color: MyColors.whiteColor),
        //     ),
        //     SizedBox(
        //       height: mq.height * 0.01,
        //     ),
        //     Text(
        //       "Your personal nutrition guide",
        //       style: TextStyle(
        //           fontSize: 25,
        //           color: MyColors.whiteColor,
        //           fontWeight: FontWeight.bold),
        //     ),
        //     SizedBox(
        //       height: mq.height * 0.03,
        //     ),
        //     CircularProgressIndicator(
        //       color: MyColors.whiteColor,
        //     ),
        //     SizedBox(
        //       height: mq.height * 0.03,
        //     ),
        //     Text(
        //       "@2025 Get your Guide, All rights reserved",
        //       style: TextStyle(
        //           fontSize: 15,
        //           fontWeight: FontWeight.bold,
        //           color: MyColors.whiteColor),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
