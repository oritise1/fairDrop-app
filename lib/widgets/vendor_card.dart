import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import '../screens/vendor_details_screen.dart';

class VendorCard extends StatelessWidget {
  final String name;
  final String tags;
  final String rating;
  final String deliveryTime;
  final String deliveryFee;

  const VendorCard({
    super.key,
    required this.name,
    required this.tags,
    required this.rating,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  @override
  Widget build(BuildContext context) {
    // Wrap the topmost Container so the entire card is clickable
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorDetailsScreen(vendorName: name),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Vendor Image Placeholder
            Container(
              height: 140,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: FairDropColors.creamBackground,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: const Icon(Icons.image, color: Colors.grey, size: 40),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      _buildRatingBadge(),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(tags, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _infoTile(Icons.access_time, deliveryTime),
                      const SizedBox(width: 16),
                      _infoTile(Icons.delivery_dining, deliveryFee),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.green, size: 14),
          const SizedBox(width: 4),
          Text(
            rating,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.grey.shade600),
        const SizedBox(width: 4),
        Text(text, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
      ],
    );
  }
}