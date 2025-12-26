// Inside FeedScreen build...

final role = ref.watch(currentRoleProvider);

// Check if user is Cadre
bool isCadre = role == Role.villageCadre;

// UI Logic
return Scaffold(
    // ...
    floatingActionButton: !isCadre ? FloatingActionButton(
        // Sirf Non-Cadre (Writer/Politician) ko Content create karne ka button dikhega
        onPressed: () => _openCreateNarrative(context),
        child: const Icon(Icons.create),
    ) : null,
    
    body: ListView(
        // Feed Items...
        // Agar Cadre hai, toh NarrativeCard mein "Mark as Posted" button highlight hoga
    ),
);
