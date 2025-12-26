// Purane roles ko update karo
enum Role { 
  // Organizational Roles
  admin, stateHead, districtHead, 
  
  // New Constituency Roles
  politician,       // The Leader
  listeningHead,    // Manages Grievances
  contentWriter,    // Creates Posts
  trainer,          // Trains Cadre
  villageCadre,     // Ground Worker
  public 
}

// User model wahi rahega, bas logic mein naye roles use honge
