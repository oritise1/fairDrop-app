import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import '../theme/main_navigation.dart';

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),
              // Success Animation/Icon
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: FairDropColors.secondaryGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle_rounded,
                  size: 100,
                  color: FairDropColors.secondaryGreen,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "Order Placed!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: FairDropColors.deepCharcoal,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Your meal from Amala Place is being prepared with care.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 48),
              
              // Delivery Tracker
              _buildDeliveryTracker(),
              
              const Spacer(),
              
              // Action Buttons
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to Main Navigation (the shell with tabs) and clear stack
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MainNavigation()),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Back to Home",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // This would typically navigate to a detailed tracking screen
                },
                child: const Text(
                  "View Order Details",
                  style: TextStyle(color: FairDropColors.primaryOrange, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryTracker() {
    return Column(
      children: [
        _buildTrackerStep(
          icon: Icons.receipt_long_rounded,
          title: "Order Received",
          subtitle: "12:30 PM",
          isCompleted: true,
          isCurrent: false,
        ),
        _buildTrackerLine(true),
        _buildTrackerStep(
          icon: Icons.soup_kitchen_rounded,
          title: "Preparing Food",
          subtitle: "The chef is working their magic",
          isCompleted: false,
          isCurrent: true,
        ),
        _buildTrackerLine(false),
        _buildTrackerStep(
          icon: Icons.delivery_dining_rounded,
          title: "Out for Delivery",
          subtitle: "Rider is heading your way",
          isCompleted: false,
          isCurrent: false,
        ),
      ],
    );
  }

  Widget _buildTrackerStep({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
    required bool isCurrent,
  }) {
    Color itemColor = isCompleted 
        ? FairDropColors.secondaryGreen 
        : (isCurrent ? FairDropColors.primaryOrange : Colors.grey.shade300);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: itemColor.withOpacity(0.1),
            shape: BoxShape.circle,
            border: isCurrent ? Border.all(color: itemColor, width: 2) : null,
          ),
          child: Icon(icon, color: itemColor, size: 24),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isCurrent ? FairDropColors.deepCharcoal : Colors.grey.shade600,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTrackerLine(bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(left: 22),
      height: 30,
      width: 2,
      color: isCompleted ? FairDropColors.secondaryGreen : Colors.grey.shade200,
    );
  }
}