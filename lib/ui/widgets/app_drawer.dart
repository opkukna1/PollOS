import 'package:flutter/material.dart';
// Ensure paths are correct based on previous steps
import '../screens/team/create_team_screen.dart'; 
import '../screens/content/poster_maker_screen.dart'; // Import Poster Screen

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final teams = [
      {'name': 'National Core Team', 'role': 'Admin', 'type': 'Organization'},
      {'name': 'Rajasthan Youth Wing', 'role': 'State Head', 'type': 'Independent'},
      {'name': 'Team Vikram Singh', 'role': 'Politician', 'type': 'Constituency'},
    ];
    int activeIndex = 2; 

    return Drawer(
      backgroundColor: Colors.grey.shade100,
      child: Column(
        children: [
          // 1. Drawer Header
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

          // 2. Team List
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
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // --- NEW FEATURE: CREATIVE TOOLS ---
          // This is the new section for Poster Maker
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text("CREATIVE STUDIO", style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
          ),

          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.purple.shade50, shape: BoxShape.circle),
              child: const Icon(Icons.brush, color: Colors.purple),
            ),
            title: const Text("One-Click Poster Maker", style: TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text("Create Viral Festival Posts"),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
              child: const Text("NEW", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
            onTap: () {
              Navigator.pop(context); // Close Drawer
              // Open Poster Maker
              Navigator.push(context, MaterialPageRoute(builder: (_) => const PosterMakerScreen()));
            },
          ),
          
          const Divider(),

          // 3. Admin Actions
          ListTile(
            leading: const Icon(Icons.add_business, color: Colors.deepOrange),
            title: const Text(
              "Create Independent Team",
              style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)
            ),
            subtitle: const Text("For Politicians & Leaders", style: TextStyle(fontSize: 12)),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateTeamScreen()));
            },
          ),

          ListTile(
            leading: const Icon(Icons.group_add_outlined),
            title: const Text("Join Existing Team"),
            onTap: () {},
          ),
          
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

