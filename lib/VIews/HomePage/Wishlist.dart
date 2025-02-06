import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:guide_app/VIews/HomePage/cart.dart';
import 'package:guide_app/VIews/HomePage/item_detail.dart';
import 'package:guide_app/VIews/HomePage/settings_page.dart';
import 'package:guide_app/utils/app_colors.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Your Wishlist"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 110,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: MyColors.blueColor)),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      Icons.add_rounded,
                      color: MyColors.blueColor,
                    ),
                    Text(
                      "Create list",
                      style: TextStyle(color: MyColors.blueColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GridTile(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/images.jpeg"),
                            const Text("Rome"),
                            const Text("2 activities")
                          ],
                        ),
                      ),
                    ),
                  ));
                }),
          )
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Padding buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.orangeColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Get.to(() => const Wishlist());
              },
              icon: Icon(Icons.favorite_border_outlined,
                  size: 30, color: MyColors.whiteColor),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => const CartPage());
              },
              icon: Icon(Icons.shopping_cart_checkout_outlined,
                  size: 30, color: MyColors.whiteColor),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => const ItemDetail());
              },
              icon: Icon(
                Icons.bookmark_outline,
                size: 30,
                color: MyColors.whiteColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(() => const SettingsPage());
              },
              icon: Icon(Icons.person_2_outlined,
                  size: 30, color: MyColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
