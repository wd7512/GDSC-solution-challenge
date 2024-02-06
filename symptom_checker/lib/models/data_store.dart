
/// Class encapsulating all categories, bodyparts, and symptoms.
/// - currently hardcoded, but can be changed to an ORM
/// 
/// 
/// 
/// 
import 'dart:math';

class DataStore {
  
  // map of data[category][bodypart]:symptoms
  Map<String, Map<String, List<String>>> data = {
    'head':{
      'face':['acne', 'redness', 'swelling'],
      'ears':['pain', 'itchiness', 'ringing'],
      'eyes':['blurred vision', 'itchy eyes', 'tearing'],
      'nose':['congestion', 'runny nose', 'sneezing'],
      'mouth':['bad breath', 'bleeding gums', 'toothache'],
      'internal':['headache'],
    },
    'torso':{
      'chest':['chest pain', 'shortness of breath', 'heart palpitations'],
      'abdomen':['abdominal pain', 'nausea', 'bloating'],
      'back':['lower back pain', 'muscle stiffness', 'numbness'],
      'neck':['sore throat', 'hoarseness', 'difficulty swallowing'],
    },
    'arms':{
      'shoulders':['shoulder pain', 'tension', 'limited mobility'],
      'elbows':['elbow pain', 'numbness', 'weakness'],
      'wrists':['wrist pain', 'tingling', 'stiffness'],
    },
    'legs':{
      'hips':['hip pain', 'tightness', 'limb alignment issues'],
      'knees':['knee pain', 'swelling', 'instability'],
      'ankles':['ankle pain', 'weakness', 'limited range of dmotion'],
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

class LocationStore {
  // Your existing map
  Map<Point, String> data = {
    Point(0.5, 0.2): 'head',
    Point(0.5, 0.5): 'torso',
    Point(0.65, 0.4): 'arms',
    Point(0.35, 0.4): 'arms',
    Point(0.5, 0.75): 'legs',
  };

  List<Point> getAllPoints() {
    return data.keys.toList();
  }

  String findClosestPoint(Point loc) {
    double minDistance = double.infinity;
    Point closestPoint = Point(0, 0);

    for (Point point in data.keys) {
      double distance = calculateDistance(loc, point);

      if (distance < minDistance) {
        minDistance = distance;
        closestPoint = point;
      }
    }

    return data[closestPoint]!;
  }

  double calculateDistance(Point a, Point b) {
    double dx = (a.x.toDouble() - b.x.toDouble());
    double dy = (a.y.toDouble() - b.y.toDouble());
    return sqrt(dx * dx + dy * dy);
  }
}