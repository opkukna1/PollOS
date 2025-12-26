import 'package:flutter/material.dart';

class ListeningFeed extends StatelessWidget {
  const ListeningFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Dashboard Stats
        Row(
          children: [
            Expanded(child: _StatCard("Urgent", "3", Colors.red)),
            const SizedBox(width: 12),
            Expanded(child: _StatCard("Pending", "12", Colors.orange)),
            const SizedBox(width: 12),
            Expanded(child: _StatCard("Resolved", "45", Colors.green)),
          ],
        ),
        const SizedBox(height: 20),
        
        const Text("Village Pulse", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),

        // Urgent Item
        _UpdateCard(
          category: "Death / Condolence",
          village: "Rampur",
          desc: "Senior Sarpanch passed away today morning. Visit required.",
          time: "20 min ago",
          isUrgent: true,
          status: "New",
        ),

        // Normal Items
        _UpdateCard(
          category: "Water Issue",
          village: "Sikandra",
          desc: "Handpump broken in Ward 3. People are angry.",
          time: "2 hours ago",
          isUrgent: false,
          status: "Read",
        ),
        _UpdateCard(
          category: "Political Mood",
          village: "Bohara",
          desc: "Opposition party meeting happening at temple square.",
          time: "5 hours ago",
          isUrgent: false,
          status: "Action Taken",
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label, count;
  final Color color;
  const _StatCard(this.label, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3))
      ),
      child: Column(
        children: [
          Text(count, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          Text(label, style: TextStyle(fontSize: 12, color: color)),
        ],
      ),
    );
  }
}

class _UpdateCard extends StatelessWidget {
  final String category, village, desc, time, status;
  final bool isUrgent;

  const _UpdateCard({
    required this.category, required this.village, required this.desc, required this.time, required this.isUrgent, required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          backgroundColor: isUrgent ? Colors.red.shade100 : Colors.blue.shade100,
          child: Icon(
            isUrgent ? Icons.priority_high : Icons.article, 
            color: isUrgent ? Colors.red : Colors.blue
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(time, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$village • $status", style: TextStyle(color: Colors.deepOrange.shade400, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(desc, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        onTap: () {
          // Open details to reply/call
        },
      ),
    );
  }
}
