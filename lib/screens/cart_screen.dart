import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Cart"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildVendorHeader("Mama Put's Kitchen"),
                const SizedBox(height: 16),
                _buildCartItem("Special Amala & Ewedu", "₦1,500", "2 items"),
                _buildCartItem("Assorted Beef (2pcs)", "₦600", "1 item"),
                const Divider(height: 40),
                _buildCartSummary(),
              ],
            ),
          ),
          _buildCheckoutAction(context),
        ],
      ),
    );
  }

  Widget _buildVendorHeader(String name) {
    return Row(
      children: [
        const Icon(Icons.restaurant, color: FairDropColors.primaryOrange, size: 20),
        const SizedBox(width: 8),
        Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCartItem(String name, String price, String qty) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
              Text(qty, style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildCartSummary() {
    return Column(
      children: [
        _summaryRow("Subtotal", "₦2,100"),
        _summaryRow("Delivery Fee", "₦500"),
        const Divider(height: 24),
        _summaryRow("Total", "₦2,600", isTotal: true),
      ],
    );
  }

  Widget _summaryRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 14,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 18 : 14,
              color: isTotal ? FairDropColors.primaryOrange : FairDropColors.deepCharcoal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckoutAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CheckoutScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: FairDropColors.primaryOrange,
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: const Text(
            "Go to Checkout",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}