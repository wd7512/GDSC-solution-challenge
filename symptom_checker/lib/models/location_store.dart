import 'dart:math';

class LocationStore {
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
