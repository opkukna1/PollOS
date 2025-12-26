import 'package:flutter/material.dart';
import '../../../core/models/models.dart';

class AddMemberScreen extends StatefulWidget {
  final String teamId;
  const AddMemberScreen({super.key, required this.teamId});

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  Role _selectedRole = Role.villageCadre;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  String _selectedVillage = "Select Village";

  @override
  Widget build(BuildContext context) {
    // Only show village dropdown if Cadre is selected
    bool isCadre = _selectedRole == Role.villageCadre;

    return Scaffold(
      appBar: AppBar(title: const Text("Add Team Member")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Member Details", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: "Full Name", prefixIcon: Icon(Icons.person)),
          ),
          const SizedBox(height: 16),
          
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(labelText: "Phone Number", prefixIcon: Icon(Icons.phone)),
          ),
          const SizedBox(height: 24),

          const Text("Assign Role", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          
          // Role Selection Chips
          Wrap(
            spacing: 8.0,
            children: [
              _roleChip("Listening Head", Role.listeningHead),
              _roleChip("Content Writer", Role.contentWriter),
              _roleChip("Trainer", Role.trainer),
              _roleChip("Village Cadre", Role.villageCadre),
            ],
          ),
          const SizedBox(height: 24),

          // Village Selection (Visible only for Cadre)
          if (isCadre) ...[
            const Text("Assign Village (Area)", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(4)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedVillage,
                  isExpanded: true,
                  items: ["Select Village", "Rampur", "Sikandra", "Bohara", "Chomu City"]
                      .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                      .toList(),
                  onChanged: (val) => setState(() => _selectedVillage = val!),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange, 
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16)
            ),
            onPressed: () {
              // Add Logic:
              // 1. Create User/Profile in Backend
              // 2. Add to Team Member List
              // 3. Send SMS Invite (Mock)
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("${_nameController.text} added as ${_selectedRole.name}!"),
                backgroundColor: Colors.green,
              ));
            },
            child: const Text("ADD MEMBER"),
          )
        ],
      ),
    );
  }

  Widget _roleChip(String label, Role role) {
    final isSelected = _selectedRole == role;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      selectedColor: Colors.deepOrange.shade100,
      labelStyle: TextStyle(color: isSelected ? Colors.deepOrange : Colors.black),
      onSelected: (selected) {
        if (selected) setState(() => _selectedRole = role);
      },
    );
  }
}
