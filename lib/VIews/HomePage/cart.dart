import 'package:flutter/material.dart';
import 'package:guide_app/main.dart';
import 'package:guide_app/utils/app_colors.dart';

class CartPage extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String rating;
  final String reviews;
  final String price;
  const CartPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.reviews,
    required this.price,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping Cart",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: MyColors.orangeColor,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thursday, December 19",
              style: TextStyle(
                color: MyColors.BlackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: mq.height * 0.02),
            // Card for the tour item
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.grey.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tour Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          widget.image,
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Tour Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                color: MyColors.BlackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Rating and Reviews
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: MyColors.orangeColor, size: 20),
                                Text(" ${widget.rating}",
                                    style:
                                        TextStyle(color: MyColors.orangeColor)),
                                Text(" (${widget.reviews})",
                                    style:
                                        TextStyle(color: MyColors.BlackColor)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            // Tour Info
                            _buildInfoRow(
                                Icons.lock_clock, "Friday, Dec 20, 9:00 AM"),
                            _buildInfoRow(Icons.person_2_outlined, "Adult"),
                            _buildInfoRow(
                                Icons.language_outlined, "Language: English"),
                            _buildInfoRow(
                                Icons.not_interested, "Non-refundable"),
                            const SizedBox(height: 12),
                            // Action Buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildActionButton("Edit", MyColors.greyColor,
                                    Icons.edit, () {}),
                                _buildActionButton("", MyColors.greyColor,
                                    Icons.delete, () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 2)
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total: \$${widget.price}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: MyColors.BlackColor,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                elevation: 4,
              ),
              onPressed: () {},
              child: Text(
                "Go to Checkout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build info rows
  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: MyColors.BlackColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(color: MyColors.BlackColor, fontSize: 15),
          ),
        ],
      ),
    );
  }

  // Helper method to build action buttons
  Widget _buildActionButton(
      String text, Color color, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: text.isNotEmpty ? 90 : 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Center(
          child: text.isNotEmpty
              ? Text(
                  text,
                  style: TextStyle(
                    color: MyColors.BlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Icon(icon, color: MyColors.BlackColor, size: 22),
        ),
      ),
    );
  }
}
