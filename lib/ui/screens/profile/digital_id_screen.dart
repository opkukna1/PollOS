import 'package:flutter/material.dart';

class DigitalIdScreen extends StatelessWidget {
  const DigitalIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // Dark background for premium feel
      appBar: AppBar(
        title: const Text("My Digital Identity"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ID CARD WIDGET
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(color: Colors.deepOrange.withOpacity(0.5), blurRadius: 20, spreadRadius: 2)
                  ],
                ),
                child: Column(
                  children: [
                    // 1. Header (Team Name)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            "TEAM VIKRAM SINGH",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                          ),
                          Text(
                            "OFFICIAL MEMBER CARD",
                            style: TextStyle(color: Colors.white70, fontSize: 10),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 2. Photo & Role
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Vikram Singh",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange.shade50,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.deepOrange),
                      ),
                      child: const Text(
                        "POLITICIAN / ADMIN",
                        style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 10),

                    // 3. Details Grid
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _detailItem("ID Number", "PS-2024-001"),
                        _detailItem("District", "Jaipur"),
                        _detailItem("Blood Group", "B+"),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // 4. QR Code (Mock)
                    Icon(Icons.qr_code_2, size: 80, color: Colors.black87),
                    const Text("Scan to Verify", style: TextStyle(fontSize: 10, color: Colors.grey)),
                    
                    const SizedBox(height: 20),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Share Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Sharing Image... (Mock)"))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black
                  ),
                  icon: const Icon(Icons.share),
                  label: const Text("Share Card on WhatsApp"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailItem(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}
