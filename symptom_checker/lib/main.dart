import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/components/category.dart';
import 'package:symptom_checker/components/selected_symptoms.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'dart:math';
import 'package:symptom_checker/models/selected_symptoms_store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Symptom Checker")),
        body: Stack(
          children: [
            Image.asset(
              "assets/StickMan.jpeg",
              key: _imageKey,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                double x = details.globalPosition.dx / MediaQuery.of(context).size.width;
                double y = details.globalPosition.dy / MediaQuery.of(context).size.height;
                Point loc = Point(x,y);
                String part = LocationStore().findClosestPoint(loc);
                print('Button pressed at coordinates: x=$x, y=$y, part=$part');
                // goes to 
                // Ensure the context used here has a Navigator
                //Navigator.push(
                //  context,
                //  MaterialPageRoute(builder: (context) => AnotherPage()),
                //);
              },
            ),
          ],
        ),
      ),
    );
  }
}