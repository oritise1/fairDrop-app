import 'package:flutter/material.dart';
import 'dart:async';
import '../theme/brand_theme.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Transition to Home after 3 seconds
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FairDropColors.creamBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Placeholder
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: FairDropColors.primaryOrange,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.scale_rounded,
                size: 80,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "FairDrop",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: FairDropColors.deepCharcoal,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Good Food. Fair Deals.",
              style: TextStyle(
                fontSize: 16,
                color: FairDropColors.deepCharcoal,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(FairDropColors.primaryOrange),
            ),
          ],
        ),
      ),
    );
  }
}