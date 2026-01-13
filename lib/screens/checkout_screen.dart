import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import 'order_success_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPayment = "Cash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("Checkout"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Delivery Address"),
            _buildAddressCard(),
            const SizedBox(height: 24),
            _buildSectionTitle("Payment Method"),
            _buildPaymentOption("Cash on Delivery", Icons.money, "Cash"),
            _buildPaymentOption("Bank Transfer", Icons.account_balance, "Transfer"),
            _buildPaymentOption("Card Payment", Icons.credit_card, "Card"),
            const SizedBox(height: 24),
            _buildFairnessNote(),
            const SizedBox(height: 100), // Space for bottom button
          ],
        ),
      ),
      bottomSheet: _buildBottomAction(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildAddressCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.location_on, color: FairDropColors.primaryOrange),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("12, Oke-Ilewo Street, Abeokuta, Ogun State",
                    style: TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, IconData icon, String value) {
    bool isSelected = _selectedPayment == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = value),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? FairDropColors.primaryOrange : Colors.transparent,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? FairDropColors.primaryOrange : Colors.grey),
            const SizedBox(width: 12),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: FairDropColors.primaryOrange),
          ],
        ),
      ),
    );
  }

  Widget _buildFairnessNote() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: FairDropColors.secondaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.auto_awesome, color: FairDropColors.secondaryGreen),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "By ordering, you're helping Mama Put's Kitchen keep 85% of their sale. That's a Fair Deal!",
              style: TextStyle(
                color: FairDropColors.secondaryGreen,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total", style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text("₦2,600",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Final success logic: Navigate to Order Success Screen
                  // We use pushReplacement to prevent users from going back to the checkout
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderSuccessScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: FairDropColors.primaryOrange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}