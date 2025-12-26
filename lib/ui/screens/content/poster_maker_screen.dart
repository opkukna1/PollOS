import 'package:flutter/material.dart';

class PosterMakerScreen extends StatefulWidget {
  const PosterMakerScreen({super.key});

  @override
  State<PosterMakerScreen> createState() => _PosterMakerScreenState();
}

class _PosterMakerScreenState extends State<PosterMakerScreen> {
  // Mock Templates
  final List<String> _templates = [
    "https://via.placeholder.com/400x500/FF5722/FFFFFF?text=Happy+Diwali",
    "https://via.placeholder.com/400x500/4CAF50/FFFFFF?text=Development+Victory",
    "https://via.placeholder.com/400x500/2196F3/FFFFFF?text=Leader+Birthday",
  ];
  
  int _selectedTemplateIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create Digital Poster")),
      body: Column(
        children: [
          // 1. Template Selector (Horizontal List)
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12),
              itemCount: _templates.length,
              itemBuilder: (context, index) {
                final isSelected = _selectedTemplateIndex == index;
                return GestureDetector(
                  onTap: () => setState(() => _selectedTemplateIndex = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      border: isSelected ? Border.all(color: Colors.deepOrange, width: 3) : null,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Image.network(_templates[index], width: 80, fit: BoxFit.cover),
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // 2. The Editor Canvas (Preview)
          Expanded(
            child: Center(
              child: Container(
                width: 300,
                height: 375, // 4:5 Aspect Ratio for Social Media
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]
                ),
                child: Stack(
                  children: [
                    // Layer 1: Template Background
                    Positioned.fill(
                      child: Image.network(
                        _templates[_selectedTemplateIndex], 
                        fit: BoxFit.cover
                      ),
                    ),

                    // Layer 2: Footer Gradient (Taaki naam saaf dikhe)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                          ),
                        ),
                      ),
                    ),

                    // Layer 3: User Photo (Bottom Left)
                    const Positioned(
                      bottom: 10,
                      left: 10,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // Cadre Photo
                        backgroundColor: Colors.white,
                      ),
                    ),

                    // Layer 4: User Name & Designation (Bottom Center/Left)
                    const Positioned(
                      bottom: 15,
                      left: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vikram Singh",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Text(
                            "District Vice President",
                            style: TextStyle(color: Colors.orangeAccent, fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    // Layer 5: Party Logo (Top Right)
                    const Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(Icons.flag, color: Colors.white, size: 30), // Mock Party Logo
                    )
                  ],
                ),
              ),
            ),
          ),

          // 3. Action Buttons
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                    label: const Text("Save to Gallery"),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Opening WhatsApp..."))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // WhatsApp Green
                      foregroundColor: Colors.white
                    ),
                    icon: const Icon(Icons.share),
                    label: const Text("Share on WA"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
