import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_app/VIews/HomePage/home_page.dart';
import 'package:guide_app/widgets/Buttons/ls_button.dart';
import 'package:guide_app/widgets/TextFields/login/ls_textfield.dart';

import '../../main.dart';
import '../utils/app_colors.dart';
import '../widgets/Buttons/profile_build_button.dart';
import '../widgets/TextFields/login/profile_build_textfield.dart';

class SignUpBuild extends StatefulWidget {
  const SignUpBuild({super.key});

  @override
  State<SignUpBuild> createState() => _SignUpBuildState();
}

class _SignUpBuildState extends State<SignUpBuild> {
  final fireStore = FirebaseFirestore.instance.collection("users");
  final nameController = TextEditingController();
  final conditionController = TextEditingController();
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final currentUser = auth.currentUser;
    final userid = currentUser!.uid;
    final email = currentUser!.email;

    mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.orangeColor,
          title: Text("Complete profile",
              style: TextStyle(
                  color: MyColors.BlackColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: MyColors.orangeColor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: mq.height * 0.1,
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
                      LsTextField(
                        hintText: "John",
                        labelText: "Full name",
                        controller: nameController,
                      ),
                      LsTextField(
                        hintText: "e.g Doe",
                        labelText: "Last name",
                        controller: conditionController,
                      ),
                      LsTextField(
                        hintText: "contact number",
                        labelText: "+123457789",
                        controller: numberController,
                      ),
                      SizedBox(
                        height: mq.height * 0.06,
                      ),
                      LsButton(
                        ontap: () {
                          try {
                            if (currentUser != null) {
                              fireStore.doc(userid).set({
                                "userId": userid,
                                "email": email,
                                "name": nameController.text,
                                "condition": conditionController.text,
                                "contact_number": numberController.text
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("User is not logged in"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Some error"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        text: "Save",
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
