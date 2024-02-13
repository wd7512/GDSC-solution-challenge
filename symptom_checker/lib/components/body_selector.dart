import 'dart:math';

import 'package:flutter/material.dart';
import 'package:symptom_checker/components/category.dart';
// import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/models/location_store.dart';

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
