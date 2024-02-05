import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Symptom Checker")),
        body: Stack(
          children: [
            Image.asset(
              "assets/StickMan.jpeg",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            GestureDetector(
              onTapDown: (TapDownDetails details) {
                double x = details.globalPosition.dx;
                double y = details.globalPosition.dy;
                print('Button pressed at coordinates: x=$x, y=$y');
              },
            ),
          ],
        ),
      ),
    );
  }
}
