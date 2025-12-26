import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../../core/models/models.dart';
import '../../../providers/app_providers.dart'; // Import existing providers

class CreateTeamScreen extends ConsumerStatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  ConsumerState<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends ConsumerState<CreateTeamScreen> {
  final _nameController = TextEditingController();
  String _selectedState = "Rajasthan"; // Mock Dropdown
  String _selectedDistrict = "Jaipur";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Start Independent Team")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Construct Your Digital War Room", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("This team will be managed by you. You will add heads, writers, and cadre.", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),

            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Constituency / Team Name",
                hintText: "e.g., Team Vikram Singh - Chomu",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            
            // State/District Mock Dropdowns
            Row(
              children: [
                Expanded(child: _mockDropdown("State", _selectedState)),
                const SizedBox(width: 16),
                Expanded(child: _mockDropdown("District", _selectedDistrict)),
              ],
            ),

            const Spacer(),
            
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
                onPressed: () {
                  // 1. Create Team Object
                  final newTeam = Team(
                    id: const Uuid().v4(),
                    name: _nameController.text,
                    type: TeamType.independent,
                    scope: Scope.district, // Or assembly
                    memberIds: ['u1'], // Current user is first member
                  );

                  // 2. Add to State (Mock Logic)
                  // Real app mein ye backend API call hogi
                  // ref.read(teamsProvider.notifier).addTeam(newTeam);
                  
                  // 3. Navigate to Manage Members
                  Navigator.pop(context); // Close Create Screen
                  // Ideally open "Manage Team" directly
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Team Created! Now add members.")));
                },
                child: const Text("CREATE TEAM"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _mockDropdown(String label, String value) {
    return InputDecorator(
      decoration: InputDecoration(labelText: label, border: const OutlineInputBorder()),
      child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
