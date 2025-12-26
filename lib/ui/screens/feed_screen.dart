import 'package:flutter/material.dart';
import '../widgets/narrative_card.dart';
// Ensure yeh path sahi ho (jahan tumne pichla file save kiya tha)
import 'content/create_content_screen.dart'; 

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Permission Logic:
    // Asli app mein hum check karenge ki user 'Writer' ya 'Politician' hai ya nahi.
    // Abhi ke liye 'true' rakha hai taaki button dikhe.
    bool canCreateContent = true; 

    return Scaffold(
      // Transparent taaki parent screen ka color match ho
      backgroundColor: Colors.transparent,

      // --- NEW FEATURE: CREATE BUTTON ---
      floatingActionButton: canCreateContent ? FloatingActionButton.extended(
        onPressed: () {
          // Navigate to Create Narrative Form
          Navigator.push(context, MaterialPageRoute(
            builder: (_) => const CreateContentScreen()
          ));
        },
        backgroundColor: Colors.black87, // High Contrast (Black button on White bg)
        icon: const Icon(Icons.edit_note, color: Colors.white),
        label: const Text("New Narrative", style: TextStyle(color: Colors.white)),
      ) : null, // Agar Cadre hai, toh button gayab ho jayega

      body: ListView(
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

          // Card 3: New Mock Data (Slogan)
          NarrativeCard(
            title: "Yuva Shakti Slogan",
            type: "Slogan",
            isBuild: true,
            level: "District",
            content: "Copy this text and post on Twitter/X immediately.",
          ),
          
          // Extra space at bottom so FAB doesn't hide the last card
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

