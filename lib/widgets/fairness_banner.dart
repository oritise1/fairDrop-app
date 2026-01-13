import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';

class FairnessBanner extends StatelessWidget {
  const FairnessBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: FairDropColors.secondaryGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                "The FairDrop Promise",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "15% Commission ensures better prices for you and better earnings for vendors.",
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }
}