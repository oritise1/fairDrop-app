import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import 'search_screen.dart';
import 'notification_screen.dart';
import 'all_vendors_screen.dart';
import 'category_results_screen.dart';
import '../widgets/category_card.dart';
import '../widgets/vendor_card.dart';
import '../widgets/fairness_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  /// Logic to determine the meal-time greeting based on current hour
  String _getGreetingText() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 11) {
      return "What's for breakfast?";
    } else if (hour >= 11 && hour < 16) {
      return "What's for lunch?";
    } else if (hour >= 16 && hour < 21) {
      return "What's for dinner?";
    } else {
      return "Craving a late-night snack?";
    }
  }

  /// Logic to determine a time-based introductory phrase
  String _getIntroPhrase() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return "Good morning,";
    if (hour >= 12 && hour < 17) return "Good afternoon,";
    return "Good evening,";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("FairDrop"),
        backgroundColor: FairDropColors.primaryOrange,
        foregroundColor: FairDropColors.creamBackground,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DYNAMIC User Greeting
            Text(
              "${_getIntroPhrase()} Ibrahim",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              _getGreetingText(),
              style: const TextStyle(
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
                children: [
                  _buildCategoryItem(context, "Swallow", Icons.restaurant_menu),
                  _buildCategoryItem(context, "Rice", Icons.rice_bowl),
                  _buildCategoryItem(context, "Drinks", Icons.local_drink),
                  _buildCategoryItem(context, "Grills", Icons.outdoor_grill),
                  _buildCategoryItem(context, "Snacks", Icons.bakery_dining),
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AllVendorsScreen()),
                    );
                  },
                  child: const Text("See All"),
                ),
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

  Widget _buildCategoryItem(BuildContext context, String name, IconData icon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryResultsScreen(categoryName: name),
          ),
        );
      },
      child: CategoryCard(name: name, icon: icon),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
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