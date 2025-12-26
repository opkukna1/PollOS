import 'package:flutter/material.dart';
// Ensure yeh path sahi ho jahan tumne pichla screen save kiya tha
import '../screens/team/create_team_screen.dart'; 

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data: Asli app mein ye Riverpod (teamsProvider) se aayega
    final teams = [
      {'name': 'National Core Team', 'role': 'Admin', 'type': 'Organization'},
      {'name': 'Rajasthan Youth Wing', 'role': 'State Head', 'type': 'Independent'},
      {'name': 'Team Vikram Singh', 'role': 'Politician', 'type': 'Constituency'}, // New Type Example
    ];
    int activeIndex = 2; // Maan lo abhi hum Politician wali team mein hain

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
                      // Yahan Team Switch Logic aayega (Riverpod state update)
                      Navigator.pop(context); // Close drawer
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // 3. Create Independent Team (Politician Action)
          // Highlighted specifically for Leadership
          ListTile(
            leading: const Icon(Icons.add_business, color: Colors.deepOrange),
            title: const Text(
              "Create Independent Team",
              style: TextStyle(
                color: Colors.deepOrange, 
                fontWeight: FontWeight.bold
              )
            ),
            subtitle: const Text("For Politicians & Leaders", style: TextStyle(fontSize: 12)),
            onTap: () {
              Navigator.pop(context); // Drawer band karo
              // Create Team Screen par jao
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateTeamScreen()));
            },
          ),

          // 4. Join Team (Cadre Action)
          ListTile(
            leading: const Icon(Icons.group_add_outlined),
            title: const Text("Join Existing Team"),
            subtitle: const Text("Using Invite Code"),
            onTap: () {
              // Future: Open Join Dialog
            },
          ),
          
          const SizedBox(height: 20), // Bottom padding
        ],
      ),
    );
  }
}

