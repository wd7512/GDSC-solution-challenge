/*

  Class encapsulating all categories, bodyparts, and symptoms.
  - currently hardcoded, but can be changed to an ORM

*/
class DataStore {
  
  // map of data[category][bodypart]:symptoms
  Map<String, Map<String, List<String>>> data = {
    'head and face':{
      'face':['acne', 'redness', 'swelling'],
      'ears':['pain', 'itchiness', 'ringing'],
      'eyes':['blurred vision', 'itchy eyes', 'tearing'],
      'nose':['congestion', 'runny nose', 'sneezing'],
      'mouth':['bad breath', 'bleeding gums', 'toothache']
    },
    'torso':{
      'chest':['chest pain', 'shortness of breath', 'heart palpitations'],
      'abdomen':['abdominal pain', 'nausea', 'bloating'],
      'back':['lower back pain', 'muscle stiffness', 'numbness'],
      'neck':['sore throat', 'hoarseness', 'difficulty swallowing']
    },
    'arms':{
      'shoulders':['shoulder pain', 'tension', 'limited mobility'],
      'elbows':['elbow pain', 'numbness', 'weakness'],
      'wrists':['wrist pain', 'tingling', 'stiffness'],
    },
    'legs':{
      'hips':['hip pain', 'tightness', 'limb alignment issues'],
      'knees':['knee pain', 'swelling', 'instability'],
      'ankles':['ankle pain', 'weakness', 'limited range of motion'],
    },
    'skin':{
      'face':['rash', 'dry skin', 'wrinkles'],
      'body':['itchy skin', 'redness', 'hives'],
      'nails':['brittle nails', 'yellowing', 'nail ridges']
    }
};


  List<String> getAllCategories() {
    return data.keys.toList();
  }

  List<String> getBodyPartsByCategory(String category) {
    if (!data.containsKey(category)) {
      return [];
    }
    return data[category]!.keys.toList();
  }

  List<String> getSymptomsByBodyPart(String category, String bodypart){
    if (!data.containsKey(category)) {
      return [];
    }
    if (!data[category]!.containsKey(bodypart)) {
      return [];
    }
    
    return data[category]![bodypart] ?? [];
  }

}
