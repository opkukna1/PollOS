import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/models.dart';
import '../../providers/app_providers.dart';
import 'auth/login_screen.dart'; // Logout ke liye

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Mock Data (Asli app mein ye Provider se aayega)
    final user = User(
      id: 'u1',
      name: 'Vikram Singh',
      email: 'vikram@pollos.app',
      photoUrl: 'https://i.pravatar.cc/150?img=11',
      teamRoles: {'t1': Role.politician}, // Mock roles
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Header Section (Orange Background)
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.orangeAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -50,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(user.photoUrl),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),

            // 2. Name & Role
            Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const Text("Senior Member • Rajasthan", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // 3. Performance Stats (Gamification)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  _StatsCard(label: "Posts Shared", value: "1,204", icon: Icons.share, color: Colors.blue),
                  const SizedBox(width: 12),
                  _StatsCard(label: "Reports Sent", value: "85", icon: Icons.assignment_turned_in, color: Colors.green),
                  const SizedBox(width: 12),
                  _StatsCard(label: "Rank", value: "#4", icon: Icons.emoji_events, color: Colors.orange),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 4. Menu Options
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.grey.shade100, blurRadius: 10)],
              ),
              child: Column(
                children: [
                  _ProfileMenuItem(
                    icon: Icons.badge, 
                    text: "My Digital ID Card", 
                    onTap: () {
                      // Future: Show ID Card
                    }
                  ),
                  const Divider(height: 1),
                  _ProfileMenuItem(
                    icon: Icons.language, 
                    text: "App Language (Hindi/English)", 
                    onTap: () {}
                  ),
                  const Divider(height: 1),
                  _ProfileMenuItem(
                    icon: Icons.lock_outline, 
                    text: "Privacy & Security", 
                    onTap: () {}
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 5. Logout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Logout Logic
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text("Logout", style: TextStyle(color: Colors.red)),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: Colors.red.shade200),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _StatsCard extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;

  const _StatsCard({required this.label, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _ProfileMenuItem({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.grey.shade100, shape: BoxShape.circle),
        child: Icon(icon, color: Colors.black87, size: 20),
      ),
      title: Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, size: 18, color: Colors.grey),
      onTap: onTap,
    );
  }
}
