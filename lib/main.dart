import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:guide_app/VIews/SplashScreen/splashScreen.dart';
import 'package:guide_app/firebase_options.dart';

late Size mq;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
      )),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
