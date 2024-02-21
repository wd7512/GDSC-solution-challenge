import 'dart:math';

import 'package:flutter/material.dart';
import 'package:symptom_checker/components/category_components.dart';

class BodySelectorStack extends StatelessWidget {
  const BodySelectorStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTapDown: (TapDownDetails details) {
            double x = details.globalPosition.dx / MediaQuery.of(context).size.width;
            double y = details.globalPosition.dy / MediaQuery.of(context).size.height;
            Point loc = Point(x,y);
            String part = LocationStore().findClosestPoint(loc);
            print('Button pressed at coordinates: x=$x, y=$y, part=$part');
            // goes to 
            // Ensure the context used here has a Navigator
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryPage(category: part)),
            );
          },
          child: Image.asset(
            "assets/CartoonPerson.jpeg",
            fit: BoxFit.contain,
          ),

        ),
      ],
    );
  }
}


class LocationStore {
  Map<Point, String> data = {
    const Point(0.5, 0.2): 'head',
    const Point(0.5, 0.5): 'torso',
    const Point(0.65, 0.4): 'arms',
    const Point(0.35, 0.4): 'arms',
    const Point(0.5, 0.75): 'legs',
  };

  List<Point> getAllPoints() {
    return data.keys.toList();
  }

  String findClosestPoint(Point loc) {
    double minDistance = double.infinity;
    Point closestPoint = const Point(0, 0);

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
