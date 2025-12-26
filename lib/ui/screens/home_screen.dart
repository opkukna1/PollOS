import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'feed_screen.dart';              // Tab 1: Narratives
import 'listening/listening_feed.dart'; // Tab 2: Reports (Village Pulse)
import 'team_screen.dart';              // Tab 3: Team
import 'profile_screen.dart';           // Tab 4: Profile

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 4 Tabs: Content, Reports, Team, Profile
  final List<Widget> _pages = [
    const FeedScreen(),
    const ListeningFeed(), 
    const TeamScreen(),
    const ProfileScreen(),
  ];

  // Dynamic Title Logic
  String get _currentTitle {
    switch (_selectedIndex) {
      case 0: return "Narrative Feed";
      case 1: return "Village Pulse"; // New Reports Tab
      case 2: return "Team Command";
      case 3: return "My Profile";
      default: return "PollOS";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar Title change hoga tab ke hisaab se
      appBar: AppBar(
        title: Text(_currentTitle),
        actions: [
          IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
        ],
      ),
      
      // Tumhara Purana Drawer
      drawer: const AppDrawer(), 
      
      body: _pages[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          // 1. Narratives
          NavigationDestination(
            icon: Icon(Icons.dynamic_feed_outlined),
            selectedIcon: Icon(Icons.dynamic_feed, color: Colors.deepOrange),
            label: 'Narratives',
          ),
          
          // 2. Reports (New - Ear Icon represent Listening)
          NavigationDestination(
            icon: Icon(Icons.hearing_outlined),
            selectedIcon: Icon(Icons.hearing, color: Colors.deepOrange),
            label: 'Reports',
          ),

          // 3. Team
          NavigationDestination(
            icon: Icon(Icons.groups_2_outlined),
            selectedIcon: Icon(Icons.groups_2, color: Colors.deepOrange),
            label: 'My Team',
          ),

          // 4. Profile
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

