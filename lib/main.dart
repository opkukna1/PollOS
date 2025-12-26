import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: PollOSApp()));
}

class PollOSApp extends StatelessWidget {
  const PollOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PollOS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Using our modern theme
      home: const HomeScreen(),
    );
  }
}
