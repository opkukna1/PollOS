import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simulating a User Model
class User {
  final String name;
  final String email;
  User({required this.name, required this.email});
}

// 1. Auth State Provider (Holds the current user or null)
final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null); // Initially logged out

  // Mock Google Login Logic
  Future<void> signInWithGoogle() async {
    // Real App mein yahan 'google_sign_in' package ka code aayega.
    // Abhi hum simulate kar rahe hain ki Google login success ho gaya.
    await Future.delayed(const Duration(seconds: 2)); // Fake network delay
    
    state = User(name: "Vikram Singh", email: "vikram@gmail.com");
  }

  void logout() {
    state = null;
  }
}
