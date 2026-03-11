import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import '../widgets/vendor_card.dart';

class AllVendorsScreen extends StatelessWidget {
  const AllVendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("All Vendors"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            onPressed: () {
              _showFilterSheet(context);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          VendorCard(
            name: "Mama Put's Kitchen",
            tags: "Authentic Amala & Abula",
            rating: "4.8",
            deliveryTime: "25-30 mins",
            deliveryFee: "₦500 delivery",
          ),
          VendorCard(
            name: "Gateway Grills",
            tags: "Smokey Jollof & Chicken",
            rating: "4.5",
            deliveryTime: "15-20 mins",
            deliveryFee: "Free delivery",
          ),
          VendorCard(
            name: "Ibadan Special",
            tags: "Pounded Yam & Egusi",
            rating: "4.7",
            deliveryTime: "30-40 mins",
            deliveryFee: "₦600 delivery",
          ),
          VendorCard(
            name: "The Rice Place",
            tags: "Fried Rice & Salad",
            rating: "4.2",
            deliveryTime: "20-25 mins",
            deliveryFee: "₦400 delivery",
          ),
        ],
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Filter By",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildFilterOption("Ratings (4.5+)"),
              _buildFilterOption("Fastest Delivery"),
              _buildFilterOption("Free Delivery"),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Apply Filters"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Checkbox(value: false, onChanged: (val) {}),
        ],
      ),
    );
  }
}