import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      appBar: AppBar(
        title: const Text("Profile"),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: FairDropColors.deepCharcoal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildUserHeader(),
            const SizedBox(height: 20),
            _buildMenuSection(context, "Account Settings", [
              _ProfileMenuItem(
                icon: Icons.person_outline_rounded,
                title: "Personal Information",
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.location_on_outlined,
                title: "Saved Addresses",
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.payment_rounded,
                title: "Payment Methods",
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 20),
            _buildMenuSection(context, "Support & Community", [
              _ProfileMenuItem(
                icon: Icons.help_outline_rounded,
                title: "Help Center",
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.card_giftcard_rounded,
                title: "Refer a Friend",
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.info_outline_rounded,
                title: "About FairDrop",
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.logout_rounded, color: FairDropColors.errorRed),
                  label: const Text(
                    "Logout",
                    style: TextStyle(color: FairDropColors.errorRed, fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: FairDropColors.errorRed),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildUserHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: FairDropColors.primaryOrange.withOpacity(0.1),
            child: const Icon(Icons.person, size: 40, color: FairDropColors.primaryOrange),
          ),
          const SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tunde Ogunleye",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: FairDropColors.deepCharcoal,
                ),
              ),
              Text(
                "tunde.dev@example.com",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
              letterSpacing: 1.1,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(children: items),
        ),
      ],
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: FairDropColors.deepCharcoal),
      title: Text(
        title,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
      onTap: onTap,
    );
  }
}