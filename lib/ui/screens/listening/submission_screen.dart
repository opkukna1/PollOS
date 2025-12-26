import 'package:flutter/material.dart';

class SubmissionScreen extends StatefulWidget {
  const SubmissionScreen({super.key});

  @override
  State<SubmissionScreen> createState() => _SubmissionScreenState();
}

class _SubmissionScreenState extends State<SubmissionScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Form Fields
  String _category = "Local Issue"; 
  String _urgency = "Medium";
  final _descController = TextEditingController();

  // Categories based on Political needs
  final List<String> _categories = [
    "Death / Condolence",   // Bahut important (Politician visit required)
    "Marriage Invitation",  // Social connect
    "Local Issue",          // Pani, Bijli, Sadak
    "Corruption Complaint", // Governance
    "Political Mood",       // Opposition activity
    "Protest / Dharna"      // Law & Order
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Submit Village Update")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. Auto-Location Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300)
              ),
              child: const Row(
                children: [
                  Icon(Icons.location_on, color: Colors.deepOrange),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Current Location", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text("Village Rampur, Ward 4", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // 2. Category Dropdown
            const Text("Select Category", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _category,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
              onChanged: (v) => setState(() => _category = v!),
            ),
            const SizedBox(height: 20),

            // 3. Urgency Selector (Chips)
            const Text("Urgency Level", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: ["Low", "Medium", "High"].map((level) {
                final isSelected = _urgency == level;
                Color color = Colors.grey;
                if (level == "High") color = Colors.red;
                if (level == "Medium") color = Colors.orange;
                if (level == "Low") color = Colors.green;

                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ChoiceChip(
                    label: Text(level),
                    selected: isSelected,
                    selectedColor: color.withOpacity(0.2),
                    labelStyle: TextStyle(
                      color: isSelected ? color : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
                    ),
                    onSelected: (val) => setState(() => _urgency = level),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // 4. Description
            TextFormField(
              controller: _descController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "What happened?",
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
                hintText: "Describe the issue details here..."
              ),
              validator: (v) => v!.isEmpty ? "Please enter details" : null,
            ),
            const SizedBox(height: 20),

            // 5. Photo Upload (Mock UI)
            OutlinedButton.icon(
              onPressed: () {}, 
              icon: const Icon(Icons.camera_alt), 
              label: const Text("Attach Photo / Video"),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12)
              ),
            ),
            
            const SizedBox(height: 30),

            // 6. Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Yahan Riverpod se data save hoga
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Report Sent to Politician!"), backgroundColor: Colors.green)
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white
                ),
                child: const Text("SUBMIT REPORT"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
