import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/Model/category_model.dart';
import 'package:guide_app/Model/experience_model.dart';
import 'package:guide_app/VIews/Cart_Exp_ItemDet_Page/cart.dart';
import 'package:guide_app/VIews/Wishlist/Wishlist.dart';
import 'package:guide_app/VIews/Cart_Exp_ItemDet_Page/item_detail.dart';
import 'package:guide_app/VIews/Settings_Page/settings_page.dart';
import 'package:guide_app/utils/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCategories();
    _loadExperiences();
  }

  final SupabaseQueryBuilder experienceDB =
      Supabase.instance.client.from('Experiences');
  List<Experience> experiences = [];

  final SupabaseQueryBuilder categoryDB =
      Supabase.instance.client.from('categories');
  List<Category> categories = [];

  Future<void> _loadCategories() async {
    try {
      final response = await categoryDB.select();
      categories = response.map((data) => Category.fromMap(data)).toList();
      setState(() {});
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  Future<void> _loadExperiences() async {
    try {
      final response = await experienceDB.select();
      experiences = response.map((data) => Experience.fromMap(data)).toList();
      setState(() {});
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  final StorageFileApi experienceImagesDB =
      Supabase.instance.client.storage.from('experience_images');
  final StorageFileApi categoryImagesDB =
      Supabase.instance.client.storage.from('category-images');
  @override
  Widget build(BuildContext context) {
    final List<String> sellerImages = [];
    for (int i = 0; i < experiences.length; i++) {
      if (experiences[i].sliderImageName != "") {
        sellerImages.add(experiences[i].sliderImageName);
      }
    }

    final List<Map<String, String>> items = [];
    for (int i = 0; i < categories.length; i++) {
      if (categories[i].imageName != "") {
        items.add({
          "images": categoryImagesDB.getPublicUrl(categories[i].imageName),
          "name": categories[i].name
        });
      }
    }
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.orangeColor,
        title: Text(
          "Home",
          style: TextStyle(color: MyColors.whiteColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Search Bar and Icons
                SizedBox(height: mq.height * 0.02),
                // Categories
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: mq.height * 0.03),
                CarouselSlider(
                  items: items.map((item) {
                    return Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 6,
                                spreadRadius: 0,
                                offset: const Offset(2, 4),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Image.network(
                              item["images"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item["name"]!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: false,

                    enableInfiniteScroll: true,
                    aspectRatio: 2.0,
                    viewportFraction:
                        0.32, // Adjusts how much of the next item is visible
                  ),
                ),

                // Likely to Sell Out Section
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Likely to sell out",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                            Image.network(
                              experienceImagesDB.getPublicUrl(sellerImages),
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
                  itemCount: experiences.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => ItemDetail(
                              title: experiences[index].place,
                              image: experienceImagesDB.getPublicUrl(
                                experiences[index].imageName,
                              ),
                              price: "\$ 20,000",
                              rating: "4.7",
                              reviews: "(3,999)",
                              subtitle: "Train tickets",
                            ));
                      },
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: GridTile(
                            child: SizedBox(
                              height: 12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Center(
                                      child: SizedBox(
                                        width: 120,
                                        height: 80,
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            fit: BoxFit.contain,
                                            experienceImagesDB.getPublicUrl(
                                              experiences[index].imageName,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    experiences[index].place,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const Text(
                                    "Train tickets",
                                    style: TextStyle(
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
                                        style: TextStyle(
                                            color: MyColors.BlackColor),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                    "\$ 20,000",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
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
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Material(
          borderRadius: BorderRadius.circular(50),
          elevation: 20,
          shadowColor: Colors.black,
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
                    Icons.bookmark_outline,
                    size: 30,
                    color: MyColors.whiteColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => const HomePage());
                  },
                  icon: Icon(
                    Icons.home_outlined,
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
      ),
    );
  }
}
