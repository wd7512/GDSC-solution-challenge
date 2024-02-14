import 'package:flutter/material.dart';
import 'package:symptom_checker/components/category_components.dart';

class BodyAreaSelector extends StatelessWidget {
  const BodyAreaSelector({super.key});

  void _handleTap(BuildContext context, TapDownDetails details) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var localPosition = renderBox.globalToLocal(details.globalPosition);

    String part = BodySelectorStore(
      imageWidth: renderBox.size.width,
      imageHeight: renderBox.size.height,
    ).getSelectedArea(localPosition.dx, localPosition.dy);

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
}
