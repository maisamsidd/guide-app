import 'package:flutter/material.dart';
import 'package:guide_app/main.dart';
import 'package:guide_app/utils/app_colors.dart';

class ItemDetail extends StatelessWidget {
  const ItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.orangeColor,
        title: Text(
          "Japan",
          style: TextStyle(color: MyColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mq.height * 0.04,
            ),
            Center(
                child: Image.asset(
              "assets/images/images.jpeg",
              fit: BoxFit.cover,
            )),
            SizedBox(
              height: mq.height * 0.04,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("About this activity",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Cancellation Policy"),
              subtitle: Text("This activity is non refundable"),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Cancellation Policy"),
              subtitle: Text("This activity is non refundable"),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Cancellation Policy"),
              subtitle: Text("This activity is non refundable"),
            ),
            const ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("Cancellation Policy"),
              subtitle: Text("This activity is non refundable"),
            ),

            //policies ends here

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                    border: Border.all(color: MyColors.orangeColor)),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 20,
                      color: MyColors.orangeColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "\$43",
                                style: TextStyle(
                                    color: MyColors.orangeColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Per person",
                                style: TextStyle(
                                    color: MyColors.BlackColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                              width: mq.width * 0.5,
                              height: mq.height * 0.05,
                              decoration: BoxDecoration(
                                  color: MyColors.blueColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text("Check availability",
                                    style: TextStyle(
                                        color: MyColors.whiteColor,
                                        fontWeight: FontWeight.bold)),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
