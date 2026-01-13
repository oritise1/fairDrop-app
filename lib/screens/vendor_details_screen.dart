import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import 'cart_screen.dart';

class VendorDetailsScreen extends StatelessWidget {
  final String vendorName;

  const VendorDetailsScreen({
    super.key,
    required this.vendorName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Elegant App Bar with Vendor Image
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                vendorName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                ),
              ),
              background: Container(
                color: FairDropColors.primaryOrange,
                child: const Icon(Icons.restaurant, size: 80, color: Colors.white24),
              ),
            ),
          ),

          // Vendor Info Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Authentic Amala & Abula",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.green, size: 18),
                              SizedBox(width: 4),
                              Text("4.8 (100+ ratings)", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: FairDropColors.secondaryGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Column(
                          children: [
                            Text("25 mins", style: TextStyle(color: FairDropColors.secondaryGreen, fontWeight: FontWeight.bold)),
                            Text("Delivery", style: TextStyle(fontSize: 10, color: FairDropColors.secondaryGreen)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  const Text(
                    "Menu Items",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // Menu Items List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildMenuItem(
                  "Special Amala & Ewedu",
                  "Served with gbegiri and your choice of protein.",
                  "₦1,500",
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildViewCartButton(context),
    );
  }

  Widget _buildMenuItem(String title, String description, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(description, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(height: 8),
                    Text(price, style: const TextStyle(color: FairDropColors.primaryOrange, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: FairDropColors.creamBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_circle, color: FairDropColors.primaryOrange, size: 30),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewCartButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: FairDropColors.primaryOrange,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "View Cart",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "₦1,500",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}