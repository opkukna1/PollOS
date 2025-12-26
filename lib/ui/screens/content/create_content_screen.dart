import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateContentScreen extends StatefulWidget {
  const CreateContentScreen({super.key});

  @override
  State<CreateContentScreen> createState() => _CreateContentScreenState();
}

class _CreateContentScreenState extends State<CreateContentScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Fields
  String _title = "";
  String _type = "Image"; // Default
  String _objective = "Build Narrative"; // Build vs Break
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create New Narrative")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. Narrative Objective (Green vs Red)
            const Text("Narrative Objective", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _RadioCard(
                    label: "BUILD (Positive)", 
                    value: "Build Narrative", 
                    groupValue: _objective, 
                    color: Colors.green,
                    icon: Icons.trending_up,
                    onChanged: (v) => setState(() => _objective = v),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _RadioCard(
                    label: "BREAK (Attack)", 
                    value: "Break Narrative", 
                    groupValue: _objective, 
                    color: Colors.red,
                    icon: Icons.trending_down,
                    onChanged: (v) => setState(() => _objective = v),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 2. Title
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Headline / Title",
                border: OutlineInputBorder(),
                hintText: "e.g., New Highway Project Approved"
              ),
              onChanged: (v) => _title = v,
              validator: (v) => v!.isEmpty ? "Title required" : null,
            ),
            const SizedBox(height: 20),

            // 3. Content Type
            const Text("Content Format", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              children: ["Image", "Video", "Article", "Slogan"].map((type) {
                return ChoiceChip(
                  label: Text(type),
                  selected: _type == type,
                  selectedColor: Colors.deepOrange.shade100,
                  labelStyle: TextStyle(
                    color: _type == type ? Colors.deepOrange : Colors.black
                  ),
                  onSelected: (selected) {
                    if(selected) setState(() => _type = type);
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // 4. Upload Box (Mock)
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _type == "Video" ? Icons.video_call : Icons.add_photo_alternate, 
                    size: 40, 
                    color: Colors.grey
                  ),
                  const SizedBox(height: 8),
                  Text("Upload $_type", style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 5. Description / Caption
            TextFormField(
              controller: _textController,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: "Caption for Cadre (Instructions)",
                border: OutlineInputBorder(),
                hintText: "Tell cadre where to share this..."
              ),
            ),

            const SizedBox(height: 30),

            // 6. Post Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save Logic Here
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Narrative Live! Sent to all Cadre."), backgroundColor: Colors.green)
                    );
                  }
                },
                icon: const Icon(Icons.send),
                label: const Text("PUBLISH TO FEED"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Custom Radio Card Widget for Selection
class _RadioCard extends StatelessWidget {
  final String label;
  final String value;
  final String groupValue;
  final Color color;
  final IconData icon;
  final Function(String) onChanged;

  const _RadioCard({
    required this.label, required this.value, required this.groupValue, 
    required this.color, required this.icon, required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.white,
          border: Border.all(color: isSelected ? color : Colors.grey.shade300, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? color : Colors.grey),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(
              color: isSelected ? color : Colors.grey, 
              fontWeight: FontWeight.bold,
              fontSize: 12
            )),
          ],
        ),
      ),
    );
  }
}

