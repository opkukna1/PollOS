import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.deepOrange,
        icon: const Icon(Icons.person_add, color: Colors.white),
        label: const Text("Add Member", style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header Stats
          Row(
            children: [
              _StatCard("Total", "142"),
              const SizedBox(width: 12),
              _StatCard("Active", "89"),
              const SizedBox(width: 12),
              _StatCard("Core", "4"),
            ],
          ),
          const SizedBox(height: 24),

          // Section 1: Core Command
          const Text("CORE COMMAND (ADMINS)", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 8),
          _MemberTile(name: "Vikram Singh", role: "Team Admin", imageUrl: "https://i.pravatar.cc/150?img=11", isAdmin: true),
          _MemberTile(name: "Amit Sharma", role: "Content Head", imageUrl: "https://i.pravatar.cc/150?img=12", isAdmin: true),

          const SizedBox(height: 24),

          // Section 2: Cadre / Volunteers
          const Text("FIELD CADRE", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 8),
          _MemberTile(name: "Rohan Das", role: "District Volunteer", imageUrl: "https://i.pravatar.cc/150?img=33", isAdmin: false),
          _MemberTile(name: "Priya Verma", role: "Social Media Warrior", imageUrl: "https://i.pravatar.cc/150?img=44", isAdmin: false),
          _MemberTile(name: "Rahul Kumar", role: "Block Coordinator", imageUrl: "https://i.pravatar.cc/150?img=55", isAdmin: false),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String count;
  const _StatCard(this.label, this.count);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Text(count, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  final String name;
  final String role;
  final String imageUrl;
  final bool isAdmin;

  const _MemberTile({required this.name, required this.role, required this.imageUrl, required this.isAdmin});

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
        leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(role),
        trailing: isAdmin 
            ? const Icon(Icons.shield, color: Colors.deepOrange, size: 18) 
            : const Icon(Icons.more_vert),
      ),
    );
  }
}
