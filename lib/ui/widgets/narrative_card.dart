import 'package:flutter/material.dart';

class NarrativeCard extends StatelessWidget {
  final String title;
  final String type; // 'Video', 'Image', 'Article'
  final bool isBuild; // true = Build (Positive), false = Break (Negative)
  final String level; // 'National', 'State', 'District'
  final String content; // Description text

  const NarrativeCard({
    super.key,
    required this.title,
    required this.type,
    required this.isBuild,
    required this.level,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    // Color logic: Build = Green, Break = Red
    final statusColor = isBuild ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header (Badges)
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: statusColor.withOpacity(0.5)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        isBuild ? Icons.arrow_circle_up : Icons.arrow_circle_down,
                        size: 14,
                        color: statusColor,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        isBuild ? "BUILD NARRATIVE" : "BREAK NARRATIVE",
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(level.toUpperCase(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
              ],
            ),
          ),

          // 2. Media Placeholder (Grey Box)
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.grey.shade200,
            child: Center(
              child: Icon(
                type == 'Video' ? Icons.play_circle_fill : Icons.image,
                size: 50,
                color: Colors.grey.shade400,
              ),
            ),
          ),

          // 3. Content Body
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text(content, style: TextStyle(color: Colors.grey.shade700)),
              ],
            ),
          ),

          // 4. Action Buttons (Modern Bar)
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ActionButton(icon: Icons.copy, label: "Copy Text"),
                _ActionButton(icon: Icons.download, label: "Download"),
                _ActionButton(icon: Icons.share, label: "Share", isPrimary: true),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPrimary;

  const _ActionButton({required this.icon, required this.label, this.isPrimary = false});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: isPrimary ? Colors.deepOrange : Colors.grey.shade700),
      label: Text(
        label,
        style: TextStyle(
          color: isPrimary ? Colors.deepOrange : Colors.grey.shade700,
          fontWeight: isPrimary ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
