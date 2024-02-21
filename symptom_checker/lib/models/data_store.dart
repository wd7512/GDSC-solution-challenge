/// Class encapsulating all categories, bodyparts, and symptoms.
/// - currently hardcoded, but should be changed to a database of some sort

class DataStore {
  // map of data[category][bodypart]:symptoms
  Map<String, Map<String, List<String>>> data = {
    'head': {
      'face': ['acne', 'redness', 'swelling', 'rash'],
      'ears': ['pain', 'itchiness', 'ringing'],
      'eyes': ['blurred vision', 'itchy eyes', 'tearing'],
      'nose': ['congestion', 'runny nose', 'sneezing'],
      'mouth': ['bad breath', 'bleeding gums', 'toothache'],
      //'internal': ['headache'],
    },
    'torso': {
      'chest': ['chest pain', 'shortness of breath', 'heart palpitations'],
      'stomach': ['stomach pain', 'nausea', 'bloating'],
      'back': ['lower back pain', 'muscle stiffness', 'numbness'],
      'neck': ['sore throat', 'hoarseness', 'difficulty swallowing'],
    },
    'arms': {
      'shoulders': ['shoulder pain', 'tension', 'limited mobility'],
      'elbows': ['elbow pain', 'numbness', 'weakness'],
      'wrists': ['wrist pain', 'tingling', 'stiffness'],
      'upper arm': [''],
      'forearm': [''],
      'hands': ['brittle nails']
    },
    'legs': {
      'hips': ['hip pain', 'tightness', 'limb alignment issues'],
      'knees': ['knee pain', 'swelling', 'instability'],
      'ankles': ['ankle pain', 'weakness', 'limited range of dmotion'],
      'upper leg': [''],
      'lower leg': [''],
    },
  };

  String getImageUrl(String identifier) {
    return 'assets/${identifier.contains(" ") ? identifier.replaceAll(" ", "_") : identifier}.jpg';
    //return 'assets/${identifier.contains(" ") ? identifier.replaceAll(" ", "_") : identifier}.jpg';
  }

  List<String> getAllCategories() {
    return data.keys.toList();
  }

  List<String> getBodyPartsByCategory(String category) {
    if (!data.containsKey(category)) {
      return [];
    }
    return data[category]!.keys.toList();
  }

  List<String> getSymptomsByBodyPart(String category, String bodypart) {
    if (!data.containsKey(category)) {
      return [];
    }
    if (!data[category]!.containsKey(bodypart)) {
      return [];
    }

    return data[category]![bodypart] ?? [];
  }
}
