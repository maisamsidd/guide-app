import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:guide_app/Authentication/login_page.dart';
import 'package:guide_app/VIews/HomePage/Wishlist.dart';
import 'package:guide_app/VIews/HomePage/cart.dart';
import 'package:guide_app/VIews/HomePage/item_detail.dart';
import 'package:guide_app/utils/app_colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.orangeColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.whiteColor),
        automaticallyImplyLeading: true,
        centerTitle: false,
        backgroundColor: MyColors.orangeColor,
        title: Text(
          "Profile",
          style: TextStyle(color: MyColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: MyColors.whiteColor,
            ),
            Center(
              child: Text(
                "Maisam Hussain",
                style: TextStyle(color: MyColors.whiteColor, fontSize: 18),
              ),
            ),
            Center(
              child: Text(
                "maisam@example.com",
                style: TextStyle(color: MyColors.whiteColor, fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(color: MyColors.liteColor),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Settings",
                      style:
                          TextStyle(color: MyColors.whiteColor, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Notifications",
                    style: TextStyle(color: MyColors.whiteColor, fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(color: MyColors.liteColor),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Support",
                      style:
                          TextStyle(color: MyColors.whiteColor, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Terms and conditions",
                    style: TextStyle(color: MyColors.whiteColor, fontSize: 18),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Legal",
                    style: TextStyle(color: MyColors.whiteColor, fontSize: 18),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Privacy Policy",
                    style: TextStyle(color: MyColors.whiteColor, fontSize: 18),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 80,
              decoration: const BoxDecoration(color: Colors.red),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        auth.signOut().then((onValue) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        });
                      },
                      child: Text(
                        "Logout",
                        style:
                            TextStyle(color: MyColors.whiteColor, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
