import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/models/models.dart';
import '../../providers/app_providers.dart';
import 'team/add_member_screen.dart'; // Ensure path is correct

class TeamScreen extends ConsumerWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Get Current State
    final currentRole = ref.watch(currentRoleProvider);
    final activeTeamId = ref.watch(activeTeamIdProvider);

    // 2. Permission Logic: Who can add members?
    // Politician, Listening Head, Admin, or Trainer
    final bool canAddMembers = [
      Role.politician, 
      Role.listeningHead, 
      Role.admin, 
      Role.trainer
    ].contains(currentRole);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Team Command"),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),

      // 3. Conditional Floating Action Button
      floatingActionButton: canAddMembers 
          ? FloatingActionButton.extended(
              onPressed: () {
                // Navigate to Add Member Screen with Active Team ID
                if (activeTeamId != null) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => AddMemberScreen(teamId: activeTeamId)
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please select a team first"))
                  );
                }
              },
              backgroundColor: Colors.deepOrange,
              icon: const Icon(Icons.person_add, color: Colors.white),
              label: const Text("Add Member", style: TextStyle(color: Colors.white)),
            ) 
          : null, // Hide button for Cadre

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header Stats
          Row(
            children: [
              _StatCard("Total Team", "142"),
              const SizedBox(width: 12),
              _StatCard("Active Now", "89"),
              const SizedBox(width: 12),
              _StatCard("Updates", "12"),
            ],
          ),
          const SizedBox(height: 24),

          // --- SECTION 1: LEADERSHIP ---
          _sectionHeader("LEADERSHIP (COMMAND CENTER)"),
          _MemberTile(
            name: "Vikram Singh", 
            role: "Politician / Leader", 
            village: "Constituency HQ",
            imageUrl: "https://i.pravatar.cc/150?img=11", 
            isCore: true
          ),
          _MemberTile(
            name: "Amit Sharma", 
            role: "Listening Head", 
            village: "Office HQ",
            imageUrl: "https://i.pravatar.cc/150?img=12", 
            isCore: true
          ),

          const SizedBox(height: 24),

          // --- SECTION 2: CONTENT & OPS ---
          _sectionHeader("OPERATIONS & CONTENT"),
          _MemberTile(
            name: "Sneha Gupta", 
            role: "Content Writer", 
            village: "Digital Cell",
            imageUrl: "https://i.pravatar.cc/150?img=5", 
            isCore: false
          ),
          _MemberTile(
            name: "Rajesh Verma", 
            role: "Trainer", 
            village: "Field Office",
            imageUrl: "https://i.pravatar.cc/150?img=8", 
            isCore: false
          ),

          const SizedBox(height: 24),

          // --- SECTION 3: VILLAGE CADRE ---
          _sectionHeader("GROUND CADRE (VILLAGE WISE)"),
          _MemberTile(
            name: "Rohan Das", 
            role: "Village Cadre", 
            village: "Rampur", // Village is Important here
            imageUrl: "https://i.pravatar.cc/150?img=33", 
            isCore: false
          ),
          _MemberTile(
            name: "Priya Verma", 
            role: "Village Cadre", 
            village: "Sikandra",
            imageUrl: "https://i.pravatar.cc/150?img=44", 
            isCore: false
          ),
          _MemberTile(
            name: "Rahul Kumar", 
            role: "Village Cadre", 
            village: "Bohara",
            imageUrl: "https://i.pravatar.cc/150?img=55", 
            isCore: false
          ),
          
          // Bottom padding for FAB
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        title, 
        style: const TextStyle(
          color: Colors.grey, 
          fontWeight: FontWeight.bold, 
          fontSize: 12,
          letterSpacing: 1.0
        )
      ),
    );
  }
}

// --- WIDGETS ---

class _StatCard extends StatelessWidget {
  final String label;
  final String count;
  const _StatCard(this.label, this.count);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, blurRadius: 4, offset: const Offset(0, 2))
          ]
        ),
        child: Column(
          children: [
            Text(count, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  final String name;
  final String role;
  final String village; // Added Village Field
  final String imageUrl;
  final bool isCore;

  const _MemberTile({
    required this.name, 
    required this.role, 
    required this.village,
    required this.imageUrl, 
    required this.isCore
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(imageUrl),
              backgroundColor: Colors.grey.shade200,
            ),
            if (isCore)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.verified, size: 14, color: Colors.deepOrange),
                ),
              )
          ],
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Text(role, style: TextStyle(color: Colors.grey.shade800, fontSize: 12)),
            const SizedBox(width: 6),
            const Text("•", style: TextStyle(color: Colors.grey)),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                village, 
                style: const TextStyle(color: Colors.deepOrange, fontSize: 12, fontWeight: FontWeight.w500), 
                overflow: TextOverflow.ellipsis
              )
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.phone, color: Colors.green),
          onPressed: () {
            // Phone call logic
          },
        ),
      ),
    );
  }
}

