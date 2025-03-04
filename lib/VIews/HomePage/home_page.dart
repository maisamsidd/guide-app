import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/VIews/Wishlist/Wishlist.dart';
import 'package:guide_app/VIews/Cart_Exp_ItemDet_Page/item_detail.dart';
import 'package:guide_app/VIews/Settings_Page/settings_page.dart';
import 'package:guide_app/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagesString = [
      "assets/images/12.jpg",
      "assets/images/13.jpg",
      "assets/images/14.jpg"
    ];
    final List<String> names = ["Florence", "Rome", "Paris"];
    final List<String> sellerImages = [
      "assets/images/ts1.jpg",
      "assets/images/ts2.jpg",
    ];
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar and Icons
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: MyColors.orangeColor,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        color: MyColors.orangeColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mq.height * 0.02),

                // Categories
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/mueseumicon.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Museum",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/entry tickets.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Tickets",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Image.asset(
                              "assets/images/guided tours.png",
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Tours",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: mq.height * 0.03),

                // Likely to Sell Out Section
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Likely to sell out",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: mq.height * 0.02),
                CarouselSlider(
                  items: sellerImages.map((sellerImages) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Stack(
                          children: [
                            Image.asset(
                              sellerImages,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                  ),
                ),
                SizedBox(height: mq.height * 0.03),

                // Experiences Section
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Experiences",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: mq.height * 0.03),

                // GridView for Experiences
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: imagesString.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, snapshot) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ItemDetail(
                              title: names[snapshot],
                              image: imagesString[snapshot],
                              price: "\$ 20,000",
                              rating: "4.7",
                              reviews: "(3,999)",
                              subtitle: "Train tickets",
                            ));
                      },
                      child: GridTile(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: Container(
                            height: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset(
                                    imagesString[snapshot],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  names[snapshot],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Text(
                                  "Train tickets",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "4.7",
                                      style: TextStyle(
                                          color: MyColors.orangeColor),
                                    ),
                                    Text(
                                      "(3,999)",
                                      style:
                                          TextStyle(color: MyColors.BlackColor),
                                    ),
                                  ],
                                ),
                                Text(
                                  "\$ 20,000",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Padding(
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
                icon: Icon(
                  Icons.favorite_border_outlined,
                  size: 30,
                  color: MyColors.whiteColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Get.to(() => const CartPage());
                },
                icon: Icon(
                  Icons.shopping_cart_checkout_outlined,
                  size: 30,
                  color: MyColors.whiteColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Get.to(() => const ItemDetail());
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
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 30,
                  color: MyColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
