/// Class encapsulating all categories, bodyparts, and symptoms.
/// - currently hardcoded, but should be changed to a database of some sort
///
///
class DataStore {
  // map of data[category][bodypart]:symptoms
  Map<String, Map<String, List<String>>> data = {
    'head': {
      'face': ['acne', 'redness', 'swelling', 'rash'],
      'ears': ['pain', 'itchiness', 'ringing'],
      'eyes': ['blurred vision', 'itchy eyes', 'tearing'],
      'nose': ['congestion', 'runny nose', 'sneezing'],
      'mouth': ['bad breath', 'bleeding gums', 'toothache'],
      'internal': ['headache'],
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

  // store for all image links
  // is very ugly but will have to do until we add a database of some sort
  Map<String, String> images = {
    // body categories
    'head': 'assets/images/default_image.jpeg',
    'torso': 'assets/images/default_image.jpeg',
    'arms': 'assets/images/default_image.jpeg',
    'legs': 'assets/images/default_image.jpeg',

    // body parts
    'face': 'assets/images/default_image.jpeg',
    'ears': 'assets/images/default_image.jpeg',
    'eyes': 'assets/images/default_image.jpeg',
    'nose': 'assets/images/default_image.jpeg',
    'mouth': 'assets/images/default_image.jpeg',
    'internal': 'assets/images/default_image.jpeg',
    'chest': 'assets/images/default_image.jpeg',
    'abdomen': 'assets/images/default_image.jpeg',
    'back': 'assets/images/default_image.jpeg',
    'neck': 'assets/images/default_image.jpeg',
    'shoulders': 'assets/images/default_image.jpeg',
    'elbows': 'assets/images/default_image.jpeg',
    'wrists': 'assets/images/default_image.jpeg',
    'upper arm': 'assets/images/default_image.jpeg',
    'forearm': 'assets/images/default_image.jpeg',
    'hands': 'assets/images/default_image.jpeg',
    'hips': 'assets/images/default_image.jpeg',
    'knees': 'assets/images/default_image.jpeg',
    'ankles': 'assets/images/default_image.jpeg',
    'upper leg': 'assets/images/default_image.jpeg',
    'lower leg': 'assets/images/default_image.jpeg',
    'body': 'assets/images/default_image.jpeg',
    'nails': 'assets/images/default_image.jpeg',

    // symptoms
    'acne': 'assets/images/default_image.jpeg',
    'redness': 'assets/images/default_image.jpeg',
    'swelling': 'assets/images/default_image.jpeg',
    'pain': 'assets/images/default_image.jpeg',
    'itchiness': 'assets/images/default_image.jpeg',
    'ringing': 'assets/images/default_image.jpeg',
    'blurred vision': 'assets/images/default_image.jpeg',
    'itchy eyes': 'assets/images/default_image.jpeg',
    'tearing': 'assets/images/default_image.jpeg',
    'congestion': 'assets/images/default_image.jpeg',
    'runny nose': 'assets/images/default_image.jpeg',
    'sneezing': 'assets/images/default_image.jpeg',
    'bad breath': 'assets/images/default_image.jpeg',
    'bleeding gums': 'assets/images/default_image.jpeg',
    'toothache': 'assets/images/default_image.jpeg',
    'headache': 'assets/images/default_image.jpeg',
    'chest pain': 'assets/images/default_image.jpeg',
    'shortness of breath': 'assets/images/default_image.jpeg',
    'heart palpitations': 'assets/images/default_image.jpeg',
    'abdominal pain': 'assets/images/default_image.jpeg',
    'nausea': 'assets/images/default_image.jpeg',
    'bloating': 'assets/images/default_image.jpeg',
    'lower back pain': 'assets/images/default_image.jpeg',
    'muscle stiffness': 'assets/images/default_image.jpeg',
    'numbness': 'assets/images/default_image.jpeg',
    'sore throat': 'assets/images/default_image.jpeg',
    'hoarseness': 'assets/images/default_image.jpeg',
    'difficulty swallowing': 'assets/images/default_image.jpeg',
    'shoulder pain': 'assets/images/default_image.jpeg',
    'tension': 'assets/images/default_image.jpeg',
    'limited mobility': 'assets/images/default_image.jpeg',
    'elbow pain': 'assets/images/default_image.jpeg',
    'weakness': 'assets/images/default_image.jpeg',
    'wrist pain': 'assets/images/default_image.jpeg',
    'tingling': 'assets/images/default_image.jpeg',
    'stiffness': 'assets/images/default_image.jpeg',
    'hip pain': 'assets/images/default_image.jpeg',
    'tightness': 'assets/images/default_image.jpeg',
    'limb alignment issues': 'assets/images/default_image.jpeg',
    'knee pain': 'assets/images/default_image.jpeg',
    'instability': 'assets/images/default_image.jpeg',
    'ankle pain': 'assets/images/default_image.jpeg',
    'limited range of motion': 'assets/images/default_image.jpeg',
    'rash': 'assets/images/default_image.jpeg',
    'dry skin': 'assets/images/default_image.jpeg',
    'wrinkles': 'assets/images/default_image.jpeg',
    'itchy skin': 'assets/images/default_image.jpeg',
    'hives': 'assets/images/default_image.jpeg',
    'brittle nails': 'assets/images/default_image.jpeg',
    'yellowing': 'assets/images/default_image.jpeg',
    'nail ridges': 'assets/images/default_image.jpeg',
  };


  String getImageUrl(String identifier) {
    if (!images.containsKey(identifier)) {
      return 'assets/images/default_image.jpeg';
    }
    return images[identifier]!;
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
