import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/VIews/Cart_Exp_ItemDet_Page/Check_availability.dart';
import 'package:guide_app/widgets/TextFields/login/ls_textfield.dart';
import '../../../main.dart';
import '../../utils/app_colors.dart';

class CartFillPage extends StatefulWidget {
  const CartFillPage({super.key});

  @override
  State<CartFillPage> createState() => _CartFillPageState();
}

class _CartFillPageState extends State<CartFillPage> {
  final fireStore = FirebaseFirestore.instance.collection("users");
  final nameController = TextEditingController();
  final conditionController = TextEditingController();
  final numberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.orangeColor,
          title: Text("Reservation details",
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
                // SizedBox(
                //   height: mq.height * 0,
                // ),
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
                        hintText: "2,3",
                        labelText: "Number of infant",
                        controller: nameController,
                      ),
                      LsTextField(
                        hintText: "2,3",
                        labelText: "number of adults",
                        controller: conditionController,
                      ),
                      LsTextField(
                        hintText: "Wheel chair, cart, etc",
                        labelText: "Item request",
                        controller: numberController,
                      ),
                      SizedBox(
                        height: mq.height * 0.06,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 14),
                          elevation: 4,
                        ),
                        onPressed: () {
                          Get.to(() => CalendarPage());
                        },
                        child: Text(
                          "check availability",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
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
