import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guide_app/VIews/Cart_Exp_ItemDet_Page/cart.dart';
import 'package:guide_app/VIews/Cart_Exp_ItemDet_Page/cart_fill_page.dart';
import 'package:guide_app/main.dart';
import 'package:guide_app/utils/app_colors.dart';

class ItemDetail extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String rating;
  final String reviews;
  final String price;

  const ItemDetail({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.reviews,
    required this.price,
  });

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.orangeColor,
        title: Text(
          widget.title,
          style: TextStyle(
              color: MyColors.whiteColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// **Activity Image**
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.image,
                  width: double.infinity,
                  height: mq.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              /// **Activity Details**
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: MyColors.BlackColor),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.subtitle,
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.rating} (${widget.reviews} reviews)",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// **Policies Section**
              Text(
                "About this activity",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: MyColors.BlackColor),
              ),
              const SizedBox(height: 10),
              _buildPolicyTile("Free Cancellation",
                  "Cancel up to 24 hours in advance for a full refund"),
              _buildPolicyTile("Instant Confirmation",
                  "Receive your ticket immediately after booking"),
              _buildPolicyTile(
                  "Mobile Ticket", "Use your phone as your ticket"),
              _buildPolicyTile("Live Tour Guide",
                  "Experience guided tours with professional guides"),
              const SizedBox(height: 20),

              /// **Pricing & Booking Section**
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: MyColors.orangeColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            " ${widget.price} Per person",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: MyColors.whiteColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.blueColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            // Get.to(() => CartPage(
                            //       image: widget.image,
                            //       title: widget.title,
                            //       subtitle: widget.subtitle,
                            //       rating: widget.rating,
                            //       reviews: widget.reviews,
                            //       price: widget.price,
                            //     ));
                            Get.to(() => CartFillPage());
                          },
                          child: Text("Proceed",
                              style: TextStyle(
                                  color: MyColors.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Reusable ListTile for Policy Section**
  Widget _buildPolicyTile(String title, String subtitle) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        leading: Icon(Icons.info, color: MyColors.orangeColor),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
