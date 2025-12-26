import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'feed_screen.dart';       // Narratives
import 'team_screen.dart';       // Team
import 'listening/listening_feed.dart'; // Reports (Village Pulse)

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 4 Tabs for the Bottom Navigation
  final List<Widget> _pages = [
    const FeedScreen(),        // Index 0: Content Feed
    const ListeningFeed(),     // Index 1: Village Reports (New)
    const TeamScreen(),        // Index 2: Team Management
    const Center(child: Text("Profile Settings (Coming Soon)")), // Index 3
  ];

  // Title changes based on selected tab
  String get _currentTitle {
    switch (_selectedIndex) {
      case 0: return "Narrative Feed";
      case 1: return "Village Pulse";
      case 2: return "Team Command";
      case 3: return "My Profile";
      default: return "PollOS";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentTitle),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        ],
      ),
      drawer: const AppDrawer(), // Tumhara Sidebar Drawer
      
      body: _pages[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          // Tab 1: Narratives
          NavigationDestination(
            icon: Icon(Icons.dynamic_feed_outlined),
            selectedIcon: Icon(Icons.dynamic_feed, color: Colors.deepOrange),
            label: 'Narratives',
          ),
          
          // Tab 2: Reports (New)
          NavigationDestination(
            icon: Icon(Icons.hearing_outlined),
            selectedIcon: Icon(Icons.hearing, color: Colors.deepOrange),
            label: 'Reports',
          ),
          
          // Tab 3: Team
          NavigationDestination(
            icon: Icon(Icons.groups_2_outlined),
            selectedIcon: Icon(Icons.groups_2, color: Colors.deepOrange),
            label: 'My Team',
          ),
          
          // Tab 4: Profile
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

