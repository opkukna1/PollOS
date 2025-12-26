// lib/providers/app_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/models/models.dart';

// --- MOCK DATA SERVICE (Internal) ---
class _MockData {
  static final User currentUser = User(
    id: 'u1',
    name: 'Vikram Singh',
    email: 'vikram@pollos.app',
    photoUrl: 'https://i.pravatar.cc/150?img=11',
    teamRoles: {
      't1': Role.politician, 
      't2': Role.stateHead,
    },
  );

  static final List<Team> teams = [
    Team(id: 't1', name: 'Team Vikram Singh', type: TeamType.constituency, scope: Scope.district, memberIds: ['u1']),
    Team(id: 't2', name: 'Rajasthan Youth Wing', type: TeamType.independent, scope: Scope.state, memberIds: ['u1']),
  ];

  static final List<Narrative> narratives = [
    Narrative(id: 'n1', title: 'Highway Development', objective: NarrativeObjective.build, issue: 'Infra', emotionalTone: 'Pride', teamId: 't1', createdByUserId: 'u1', createdAt: DateTime.now()),
  ];

  static final List<ContentItem> content = [
    ContentItem(id: 'c1', narrativeId: 'n1', type: ContentType.video, url: '', contentText: 'Check out the speed!', level: Scope.district),
  ];
}

// --- PROVIDERS ---

// 1. User Provider
final userProvider = StateProvider<User?>((ref) => _MockData.currentUser);

// 2. Active Team ID Provider (Default to first team)
final activeTeamIdProvider = StateProvider<String?>((ref) => _MockData.teams.first.id);

// 3. Teams Provider
final teamsProvider = StateProvider<List<Team>>((ref) => _MockData.teams);

// 4. Narratives Provider
final narrativesProvider = StateProvider<List<Narrative>>((ref) => _MockData.narratives);

// 5. Content Provider
final contentProvider = StateProvider<List<ContentItem>>((ref) => _MockData.content);

// 6. Current Role Provider (Most Important Logic)
// Yeh automatically calculate karega ki Active Team mein user ka kya role hai
final currentRoleProvider = Provider<Role?>((ref) {
  final user = ref.watch(userProvider);
  final teamId = ref.watch(activeTeamIdProvider);
  
  if (user == null || teamId == null) return null;
  return user.teamRoles[teamId];
});
