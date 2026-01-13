import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import 'search_screen.dart';
import '../widgets/category_card.dart';
import '../widgets/vendor_card.dart';
import '../widgets/fairness_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("FairDrop"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Greeting
            const Text(
              "Delivering Fairness,",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Text(
              "What's for lunch?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: FairDropColors.deepCharcoal,
              ),
            ),
            const SizedBox(height: 20),

            // Search Bar Trigger
            _buildSearchBar(context),
            const SizedBox(height: 24),

            // Componentized Fairness Banner
            const FairnessBanner(),
            const SizedBox(height: 30),

            // Categories Section
            const Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(name: "Swallow", icon: Icons.restaurant_menu),
                  CategoryCard(name: "Rice", icon: Icons.rice_bowl),
                  CategoryCard(name: "Drinks", icon: Icons.local_drink),
                  CategoryCard(name: "Grills", icon: Icons.outdoor_grill),
                  CategoryCard(name: "Snacks", icon: Icons.bakery_dining),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Popular Vendors Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Popular Near You",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text("See All")),
              ],
            ),
            const SizedBox(height: 8),

            // Componentized Vendor Cards
            const VendorCard(
              name: "Mama Put's Kitchen",
              tags: "Authentic Amala & Abula",
              rating: "4.8",
              deliveryTime: "25-30 mins",
              deliveryFee: "₦500 delivery",
            ),
            const VendorCard(
              name: "Gateway Grills",
              tags: "Smokey Jollof & Chicken",
              rating: "4.5",
              deliveryTime: "15-20 mins",
              deliveryFee: "Free delivery",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to dedicated search flow
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: FairDropColors.primaryOrange),
            SizedBox(width: 10),
            Text(
              "Search for food or vendors",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}