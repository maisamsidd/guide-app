import 'package:flutter/material.dart';

import '../../Controller/SplashServices/splashServices.dart';
import '../../main.dart';
import '../../utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Splashservices splash = Splashservices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash.splashServices(context);
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
