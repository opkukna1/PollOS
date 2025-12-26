import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/models.dart';
import '../../providers/app_providers.dart';
import '../home_screen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  // Default selection
  Role _selectedRole = Role.villageCadre;
  final _phoneController = TextEditingController();
  final _villageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Complete Profile"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Who are you?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Select your role to customize the app experience.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // 1. Role Selection Cards
            Row(
              children: [
                Expanded(child: _RoleCard(
                  title: "Leader / Neta",
                  subtitle: "I manage a team",
                  icon: Icons.mic_external_on,
                  isSelected: _selectedRole == Role.politician,
                  onTap: () => setState(() => _selectedRole = Role.politician),
                )),
                const SizedBox(width: 16),
                Expanded(child: _RoleCard(
                  title: "Cadre / Karyakarta",
                  subtitle: "I work on ground",
                  icon: Icons.groups,
                  isSelected: _selectedRole == Role.villageCadre,
                  onTap: () => setState(() => _selectedRole = Role.villageCadre),
                )),
              ],
            ),

            const SizedBox(height: 30),

            // 2. Phone Number (Mandatory)
            const Text("WhatsApp Number", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: "+91 98765 43210",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),

            // 3. Village Name (Only if Cadre)
            if (_selectedRole == Role.villageCadre) ...[
              const SizedBox(height: 20),
              const Text("Village / Ward Name", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextField(
                controller: _villageController,
                decoration: const InputDecoration(
                  hintText: "e.g., Rampur",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.home),
                ),
              ),
            ],

            const SizedBox(height: 40),

            // 4. Continue Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Save User Data Logic Here
                  // ref.read(userProvider.notifier).updateRole(_selectedRole);
                  
                  // Navigate to Home
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(builder: (_) => const HomeScreen())
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("GET STARTED"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper Widget for Selection Card
class _RoleCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title, required this.subtitle, required this.icon, 
    required this.isSelected, required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.deepOrange.shade50 : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.deepOrange : Colors.grey.shade300,
            width: 2
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: isSelected ? Colors.deepOrange : Colors.grey),
            const SizedBox(height: 12),
            Text(title, style: TextStyle(
              fontWeight: FontWeight.bold, 
              color: isSelected ? Colors.deepOrange : Colors.black
            )),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
