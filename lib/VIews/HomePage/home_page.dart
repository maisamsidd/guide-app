import 'package:carousel_slider/carousel_slider.dart';
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          prefixIcon:
                              Icon(Icons.search, color: MyColors.orangeColor),
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
                        Icons.notifications,
                        color: MyColors.orangeColor,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mq.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCategory("assets/images/mueseumicon.png", "Museum"),
                    buildCategory("assets/images/entry tickets.png", "Tickets"),
                    buildCategory("assets/images/guided tours.png", "Tours"),
                  ],
                ),
                SizedBox(height: mq.height * 0.03),
                const Text(
                  "Likely to Sell Out",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
                SizedBox(height: mq.height * 0.02),
                CarouselSlider(
                  items: sellerImages.map((sellerImages) {
                    return buildCarouselItemForTopSeller(sellerImages);
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Experiences",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                SizedBox(height: mq.height * 0.03),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: imagesString.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
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
                      child: buildGridItem(
                        imagesString[snapshot],
                        names[snapshot],
                        "Train tickets",
                        "4.7",
                        "(3,999)",
                        "\$ 20,000",
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
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: MyColors.orangeColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Image.asset(imagePath, width: 30, height: 30),
          ),
        ),
        const SizedBox(height: 10),
        Text(label,
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Container buildCarouselItemForTopSeller(String imagePath) {
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
              imagePath,
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
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                "Top Seller",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildGridItem(String imagePath, String title, String subtitle,
      String rating, String reviews, String price) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: MyColors.orangeColor, size: 16),
                    Text(rating,
                        style: TextStyle(
                            color: MyColors.orangeColor, fontSize: 14)),
                    Text(reviews,
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 14)),
                  ],
                ),
                Text(
                  price,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildBottomNavigationBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.to(() => const Wishlist());
            },
            icon: Icon(Icons.favorite_border,
                size: 30, color: MyColors.orangeColor),
          ),
          // IconButton(
          //   onPressed: () {
          //     Get.to(() => const CartPage());
          //   },
          //   icon: Icon(Icons.shopping_cart, size: 30, color: MyColors.orangeColor),
          // ),
          // IconButton(
          //   onPressed: () {
          //     Get.to(() => const ItemDetail());
          //   },
          // icon: Icon(Icons.bookmark_border, size: 30, color: MyColors.orangeColor),
          // ),
          IconButton(
            onPressed: () {
              Get.to(() => const SettingsPage());
            },
            icon: Icon(Icons.person_outline,
                size: 30, color: MyColors.orangeColor),
          ),
        ],
      ),
    );
  }
}
