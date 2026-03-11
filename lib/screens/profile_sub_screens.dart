import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';

// --- PERSONAL INFORMATION SCREEN ---
class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("Personal Information"),
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildInfoField("Full Name", "Ibrahim Abdulkareem"),
            _buildInfoField("Email Address", "ikareemabiodun730@gmail.com"),
            _buildInfoField("Phone Number", "+234 810 123 4567"),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: FairDropColors.primaryOrange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Edit Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

// --- SAVED ADDRESSES SCREEN ---
class SavedAddressesScreen extends StatelessWidget {
  const SavedAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("Saved Addresses"),
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildAddressTile("Home", "123 Alake Estate, Abeokuta, Ogun State", Icons.home_rounded),
          _buildAddressTile("Office", "45 Gateway Road, ICT Hub, Abeokuta", Icons.work_rounded),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_location_alt_rounded, color: FairDropColors.primaryOrange),
            label: const Text("Add New Address", style: TextStyle(color: FairDropColors.primaryOrange, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressTile(String label, String address, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: FairDropColors.primaryOrange.withOpacity(0.1),
          child: Icon(icon, color: FairDropColors.primaryOrange, size: 20),
        ),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(address),
        trailing: const Icon(Icons.more_vert_rounded, size: 20),
      ),
    );
  }
}

// --- PAYMENT METHODS SCREEN ---
class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("Payment Methods"),
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPaymentTile("**** **** **** 4242", "Expires 12/26", Icons.credit_card_rounded),
          _buildPaymentTile("FairDrop Wallet", "Balance: ₦2,450.00", Icons.account_balance_wallet_rounded),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
            label: const Text("Add Payment Method"),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentTile(String title, String subtitle, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: FairDropColors.deepCharcoal),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.check_circle, color: Colors.green, size: 20),
      ),
    );
  }
}