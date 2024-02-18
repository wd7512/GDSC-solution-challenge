import 'package:flutter/material.dart';
import 'package:symptom_checker/components/category_components.dart';
import 'dart:math';

class BodyAreaSelector extends StatelessWidget {
  const BodyAreaSelector({super.key});

  void _handleTap(BuildContext context, TapDownDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var localPosition = renderBox.globalToLocal(details.globalPosition);

    String part = BodySelectorStore(
      imageWidth: renderBox.size.width,
      imageHeight: renderBox.size.height,
    ).getSelectedAreaPoints(localPosition.dx, localPosition.dy);

    if (part != '') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryPage(category: part)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _handleTap(context, details),
      child: Image.asset(
        'assets/CartoonPerson.jpeg',
        fit: BoxFit.contain,
      ),
    );
  }
}

class BodySelectorStore {
  double imageWidth;
  double imageHeight;
  late Map<String, List<double>> areas;
  late Map<String, List<double>> points;

  BodySelectorStore({required this.imageWidth, required this.imageHeight}) {
    // areas stored as category:[minX,maxX,minY,maxY]
    areas = {
      'head': [imageWidth / 3, 2 * imageWidth / 3, 0, imageHeight / 6],
      'torso': [
        imageWidth / 3,
        2 * imageWidth / 3,
        imageHeight / 6,
        imageHeight / 2
      ],
      'leftArm': [0, imageWidth / 3, imageHeight / 6, imageHeight / 2],
      'rightArm': [
        2 * imageWidth / 3,
        imageWidth,
        imageHeight / 6,
        imageHeight / 2
      ],
      'legs': [
        imageWidth / 4,
        2 * imageWidth / 4,
        imageHeight / 2,
        imageHeight
      ],
    };

    points = {
      'head': [imageWidth * 0.5, imageHeight * 0.9],
      'torso': [imageWidth * 0.5, imageHeight * 0.6],
      'leftArm': [imageWidth * 0.25, imageHeight * 0.6],
      'rightArm': [imageWidth * 0.75, imageHeight * 0.6],
      'legs': [imageWidth * 0.5, imageHeight * 0.3]
    };
  }

  String getSelectedArea(double x, double y) {
    for (var entry in areas.entries) {
      List<double> coordinates = entry.value;
      if (x >= coordinates[0] &&
          x <= coordinates[1] &&
          y >= coordinates[2] &&
          y <= coordinates[3]) {
        if (entry.key == "leftArm" || entry.key == "rightArm") {
          return "arms";
        } else {
          return entry.key;
        }
      }
    }
    return '';
  }

  // this is not fully tested / working yet
  String getSelectedAreaPoints(double x, double y) {
    String body_part = '';
    num distance = pow(2,32);
    for (var entry in points.entries) {
      List<double> coordinates = entry.value;
      num local_distance = pow(pow(x - coordinates[0], 2) + pow(x-coordinates[1],2), 0.5);
      if (local_distance < distance) {
        body_part = entry.key;
        distance = local_distance;

        
      }
    }
    print(body_part);
    print(distance);
    if (body_part == "leftArm" || body_part == "rightArm") {
          return "arms";
        } else {
          return body_part;
        }
  }
}
