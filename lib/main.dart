import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'ui/screens/auth/login_screen.dart'; // Import Login
import 'ui/screens/home_screen.dart'; // Import Home

void main() {
  runApp(const ProviderScope(child: PollOSApp()));
}

class PollOSApp extends ConsumerWidget {
  const PollOSApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'PollOS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // Start with Login Screen
      home: const LoginScreen(),
    );
  }
}

