import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import '../widgets/vendor_card.dart';

class CategoryResultsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryResultsScreen({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: Text(categoryName),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
      ),
      body: Column(
        children: [
          // Category Stats/Summary
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: FairDropColors.primaryOrange.withOpacity(0.1),
                  child: const Icon(Icons.restaurant_menu, color: FairDropColors.primaryOrange),
                ),
                const SizedBox(width: 12),
                Text(
                  "12 Vendors found for $categoryName",
                  style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 4,
              itemBuilder: (context, index) {
                return const VendorCard(
                  name: "Category Vendor",
                  tags: "Specialty Cuisine",
                  rating: "4.6",
                  deliveryTime: "25 mins",
                  deliveryFee: "₦500 delivery",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}