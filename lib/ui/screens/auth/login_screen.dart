import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../providers/auth_provider.dart';
import '../home_screen.dart'; // Ensure correct import path

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  bool _isLoading = false;

  Future<void> _handleGoogleSignIn() async {
    setState(() => _isLoading = true);

    // Call the provider to sign in
    await ref.read(authProvider.notifier).signInWithGoogle();

    if (mounted) {
      // Check if user is logged in
      final user = ref.read(authProvider);
      if (user != null) {
        // Navigate to Home Screen (Remove back button)
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // 1. Logo Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.deepOrange.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.campaign_rounded, // Narrative metaphor
                  size: 60,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 30),

              // 2. App Name & Tagline
              const Text(
                "PollOS",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Narrative Build & Break System",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              // 3. Google Login Button
              // "Only Google" requirement enforced here
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: _isLoading ? null : _handleGoogleSignIn,
                  icon: _isLoading 
                      ? const SizedBox(
                          width: 24, height: 24, 
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.black87)
                        )
                      : const FaIcon(FontAwesomeIcons.google, color: Colors.black87), // Google Brand Icon
                  label: Text(
                    _isLoading ? "Signing in..." : "Continue with Google",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black87,
                    elevation: 2,
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 20),
              
              // 4. Disclaimer
              Text(
                "By clicking continue, you agree to our\nTerms of Service and Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
