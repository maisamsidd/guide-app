import 'package:flutter/material.dart';
import 'package:guide_app/main.dart';
import 'package:guide_app/utils/app_colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping cart"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Thursday, December 19",
              style: TextStyle(
                  color: MyColors.BlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: mq.height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: ListTile(
                leading: SizedBox(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/images.jpeg")),
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Japan and ancient tour",
                          style: TextStyle(
                              color: MyColors.BlackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Row(
                      children: [
                        Text("4.7",
                            style: TextStyle(color: MyColors.orangeColor)),
                        Text("(3,999)",
                            style: TextStyle(color: MyColors.BlackColor)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.lock_clock),
                        Text("Friday December 20, 9:00 am",
                            style: TextStyle(
                                color: MyColors.BlackColor, fontSize: 13)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.person_2_outlined),
                        Text("Adult",
                            style: TextStyle(
                                color: MyColors.BlackColor, fontSize: 13)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.language_outlined),
                        Text("Language: English",
                            style: TextStyle(
                                color: MyColors.BlackColor, fontSize: 13)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.not_interested),
                        Text("This activity is non refundable",
                            style: TextStyle(
                                color: MyColors.BlackColor, fontSize: 13)),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: MyColors.greyColor,
                          ),
                          child: const Center(
                            child: Text("edit"),
                          ),
                        ),
                        SizedBox(
                          width: mq.width * 0.02,
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: MyColors.greyColor,
                          ),
                          child: const Center(
                            child: Icon(Icons.delete),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total : \$62.20",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: MyColors.blueColor,
              ),
              child: Center(
                child: Text("Go to checkout",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColors.whiteColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
