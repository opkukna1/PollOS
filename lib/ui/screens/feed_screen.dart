import 'package:flutter/material.dart';
import '../widgets/narrative_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        // Title
        Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text("Today's Tasks", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),

        // Card 1: Positive Build
        NarrativeCard(
          title: "New Highway Inauguration",
          type: "Video",
          isBuild: true,
          level: "National",
          content: "Share this reel showing the speed of development. Use hashtag #FastProgress.",
        ),

        // Card 2: Negative Break (Attack)
        NarrativeCard(
          title: "Expose Water Crisis Failure",
          type: "Image",
          isBuild: false,
          level: "State",
          content: "Opposition failed to deliver water. Post this graphic in local WhatsApp groups.",
        ),
      ],
    );
  }
}
