import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'feed_screen.dart'; // Import Feed
import 'team_screen.dart'; // Import Team

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // List of screens for the bottom nav
  final List<Widget> _pages = [
    const FeedScreen(),
    const TeamScreen(),
    const Center(child: Text("Profile (Coming Soon)")), // Placeholder
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? "Narrative Feed" : "Team Command"),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        ],
      ),
      drawer: const AppDrawer(), // Tumhara purana button card wala drawer
      
      body: _pages[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dynamic_feed_outlined),
            selectedIcon: Icon(Icons.dynamic_feed, color: Colors.deepOrange),
            label: 'Narratives',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_2_outlined),
            selectedIcon: Icon(Icons.groups_2, color: Colors.deepOrange),
            label: 'My Team',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: Colors.deepOrange),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

