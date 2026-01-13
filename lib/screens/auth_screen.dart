import '../theme/main_navigation.dart';
import 'package:flutter/material.dart';
import '../theme/brand_theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _isOtpSent = false;
  bool _isLoading = false;

  void _handleAuth() async {
    setState(() => _isLoading = true);

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    if (!_isOtpSent) {
      // Transition to OTP phase
      setState(() {
        _isOtpSent = true;
        _isLoading = false;
      });
    } else {
      // Final Login transition
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigation()),
          (route) => false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _isOtpSent 
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: FairDropColors.deepCharcoal),
              onPressed: () => setState(() => _isOtpSent = false),
            ) 
          : null,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              _isOtpSent ? "Verify Phone" : "Welcome to FairDrop",
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: FairDropColors.deepCharcoal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _isOtpSent 
                ? "Enter the 6-digit code sent to ${_phoneController.text}" 
                : "Enter your phone number to get started",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 40),
            
            // Input Field
            if (!_isOtpSent) ...[
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "08012345678",
                  prefixIcon: const Icon(Icons.phone_iphone_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ] else ...[
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, letterSpacing: 8, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  hintText: "000000",
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleAuth,
                child: _isLoading 
                  ? const CircularProgressIndicator(color: Colors.white)
                  : Text(_isOtpSent ? "Verify & Login" : "Continue"),
              ),
            ),

            const SizedBox(height: 20),
            if (!_isOtpSent)
              const Center(
                child: Text(
                  "By continuing, you agree to our Terms and Conditions",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}