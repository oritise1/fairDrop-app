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
                              Text("4.8 (100+ ratings)",
                                  style: TextStyle(fontWeight: FontWeight.bold)),
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
                            Text("25 mins",
                                style: TextStyle(
                                    color: FairDropColors.secondaryGreen,
                                    fontWeight: FontWeight.bold)),
                            Text("Delivery",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: FairDropColors.secondaryGreen)),
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

          // Menu Items List using the new Stateful Item widget
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return MenuItemRow(
                  title: index == 0 ? "Special Amala & Ewedu" : "Jollof Rice Combo",
                  description: "Served with gbegiri and your choice of protein.",
                  price: "₦1,500",
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
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Text(
                "₦1,500",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A dedicated Stateful Widget for each Menu Item to handle its own quantity
class MenuItemRow extends StatefulWidget {
  final String title;
  final String description;
  final String price;

  const MenuItemRow({
    super.key,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  State<MenuItemRow> createState() => _MenuItemRowState();
}

class _MenuItemRowState extends State<MenuItemRow> {
  int _quantity = 0;

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 4),
                    Text(widget.description,
                        style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    const SizedBox(height: 8),
                    Text(widget.price,
                        style: const TextStyle(
                            color: FairDropColors.primaryOrange,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              
              // Dynamic Quantity Selector
              Column(
                children: [
                  if (_quantity == 0)
                    GestureDetector(
                      onTap: _increment,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: FairDropColors.primaryOrange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: FairDropColors.primaryOrange),
                        ),
                        child: const Text(
                          "ADD",
                          style: TextStyle(
                            color: FairDropColors.primaryOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        color: FairDropColors.primaryOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: _decrement,
                            icon: const Icon(Icons.remove, color: Colors.white, size: 18),
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                          ),
                          Text(
                            "$_quantity",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: _increment,
                            icon: const Icon(Icons.add, color: Colors.white, size: 18),
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}