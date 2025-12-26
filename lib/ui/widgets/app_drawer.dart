import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data: Asli app mein ye Riverpod se aayega
    final teams = [
      {'name': 'National Core Team', 'role': 'Admin', 'type': 'Organization'},
      {'name': 'Rajasthan Youth Wing', 'role': 'State Head', 'type': 'Independent'},
      {'name': 'Jaipur IT Cell', 'role': 'Cadre', 'type': 'Independent'},
    ];
    int activeIndex = 0; // Mock active team

    return Drawer(
      backgroundColor: Colors.grey.shade100,
      child: Column(
        children: [
          // 1. Drawer Header (User Profile)
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepOrange),
            accountName: const Text("Vikram Singh", style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: const Text("vikram@pollos.app"),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("VS", style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text("SWITCH TEAM", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          ),

          // 2. Team List as "Modern Button Cards"
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];
                final isActive = index == activeIndex;

                return Card(
                  elevation: isActive ? 4 : 0,
                  color: isActive ? Colors.white : Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: isActive ? const BorderSide(color: Colors.deepOrange, width: 1.5) : BorderSide.none,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.deepOrange.withOpacity(0.1) : Colors.grey.shade200,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.groups,
                        color: isActive ? Colors.deepOrange : Colors.grey,
                      ),
                    ),
                    title: Text(
                      team['name']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isActive ? Colors.deepOrange : Colors.black87,
                      ),
                    ),
                    subtitle: Text("${team['role']} • ${team['type']}"),
                    trailing: isActive ? const Icon(Icons.check_circle, color: Colors.deepOrange) : null,
                    onTap: () {
                      // Yahan Team Switch logic aayega
                      Navigator.pop(context); // Close drawer
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("Create or Join New Team"),
            onTap: () {},
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
