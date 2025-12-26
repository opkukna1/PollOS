// lib/core/models/models.dart

enum Role { 
  admin, stateHead, districtHead, 
  politician, listeningHead, contentWriter, trainer, villageCadre, 
  public 
}

enum TeamType { independent, organization, constituency }
enum Scope { national, state, district }
enum NarrativeObjective { build, break_narrative }
enum ContentType { video, image, article, slogan }

class User {
  final String id;
  final String name;
  final String email;
  final String photoUrl;
  final Map<String, Role> teamRoles; 

  User({required this.id, required this.name, required this.email, required this.photoUrl, required this.teamRoles});
}

class Team {
  final String id;
  final String name;
  final TeamType type;
  final Scope scope;
  final List<String> memberIds;

  Team({required this.id, required this.name, required this.type, required this.scope, required this.memberIds});
}

class Narrative {
  final String id;
  final String title;
  final NarrativeObjective objective;
  final String issue; 
  final String emotionalTone;
  final String teamId;
  final String createdByUserId;
  final DateTime createdAt;

  Narrative({required this.id, required this.title, required this.objective, required this.issue, required this.emotionalTone, required this.teamId, required this.createdByUserId, required this.createdAt});
}

class ContentItem {
  final String id;
  final String narrativeId;
  final ContentType type;
  final String url;
  final String contentText;
  final Scope level;
  bool isPosted;

  ContentItem({required this.id, required this.narrativeId, required this.type, required this.url, required this.contentText, required this.level, this.isPosted = false});
}

