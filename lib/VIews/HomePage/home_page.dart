import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/VIews/HomePage/Wishlist.dart';
import 'package:guide_app/VIews/HomePage/cart.dart';
import 'package:guide_app/VIews/HomePage/item_detail.dart';
import 'package:guide_app/VIews/HomePage/settings_page.dart';
import 'package:guide_app/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> carouselItems = [
      "Explore Japan",
      "Discover Paris",
      "Visit New York",
      "Relax in Bali",
      "Experience London",
    ];

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
            padding: const EdgeInsets.all(16.0), // Add consistent padding
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: MyColors.orangeColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notification_important_outlined,
                        color: MyColors.orangeColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mq.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCategory("assets/images/mueseumicon.png", "Mueseum"),
                    const SizedBox(width: 5),
                    buildCategory(
                        "assets/images/entry tickets.png", "Entry tickets"),
                    const SizedBox(width: 5),
                    buildCategory(
                        "assets/images/guided tours.png", "guided tours"),
                    const SizedBox(width: 10),
                    // buildCategory("assets/images/hotel.png", "Hotels"),
                    // const SizedBox(width: 25),
                    // buildCategory("assets/images/internet.png", "eSim"),
                  ],
                ),
                SizedBox(height: mq.height * 0.03),
                const Text(
                  "Likely to sell out",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                CarouselSlider(
                  items: sellerImages.map((sellerImages) {
                    return buildCarouselItemForTopSeller(sellerImages);
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                  ),
                ),
                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Where to next?",
                //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //   ),
                // ),
                // SizedBox(height: mq.height * 0.02),
                // SizedBox(
                //   width: mq.width * 0.9,
                //   height: mq.height * 0.085,
                //   child: CarouselSlider(
                //     items: carouselItems.map((item) {
                //       return buildCarouselItem(
                //           "assets/images/images.jpeg", "Japan");
                //     }).toList(),
                //     options: CarouselOptions(
                //       autoPlay: true,
                //       enlargeCenterPage: true,
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       enableInfiniteScroll: true,
                //       autoPlayAnimationDuration:
                //           const Duration(milliseconds: 800),
                //       viewportFraction: 0.55,
                //     ),
                //   ),
                // ),
                SizedBox(height: mq.height * 0.03),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Experiences",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: mq.height * 0.03),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: imagesString.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, snapshot) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => const ItemDetail());
                      },
                      child: GridTile(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 10),
                          child: buildGridItem(
                              imagesString[snapshot],
                              names[snapshot],
                              "Train tickets",
                              "4.7",
                              "(3,999)",
                              "\$ 20,000"),
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
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Column buildCategory(String imagePath, String label) {
    return Column(
      children: [
        SizedBox(width: 30, height: 30, child: Image.asset(imagePath)),
        const SizedBox(height: 10),
        Text(label),
      ],
    );
  }

  Container buildCarouselItem(String imagePath, String label) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.greyColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            label,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  Container buildCarouselItemForTopSeller(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.whiteColor,
      ),
      child: SizedBox(
        width: 300,
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column buildGridItem(String imagePath, String title, String subtitle,
      String rating, String reviews, String price) {
    return Column(
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
            imagePath,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(subtitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        Row(
          children: [
            Text(rating, style: TextStyle(color: MyColors.orangeColor)),
            Text(reviews, style: TextStyle(color: MyColors.BlackColor)),
          ],
        ),
        Text(price, style: const TextStyle(fontWeight: FontWeight.bold))
      ],
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
