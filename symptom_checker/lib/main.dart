import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Symptom Tracker',
      home: HomePage(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 147, 164, 202)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 147, 164, 202),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Checker'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              BodyPartButton(
                bodyPart: 'Head',
                symptoms: ['Symptom 1', 'Symptom 2', 'Symptom 3', 'Symptom 4', 'Symptom 5'],
              ),
              BodyPartButton(
                bodyPart: 'Torso',
                symptoms: ['Symptom 1', 'Symptom 2', 'Symptom 3', 'Symptom 4', 'Symptom 5'],
              ),
              BodyPartButton(
                bodyPart: 'Arms',
                symptoms: ['Symptom 1', 'Symptom 2', 'Symptom 3', 'Symptom 4', 'Symptom 5'],
              ),
              BodyPartButton(
                bodyPart: 'Legs',
                symptoms: ['Symptom 1', 'Symptom 2', 'Symptom 3', 'Symptom 4', 'Symptom 5'],
              ),
              BodyPartButton(
                bodyPart: 'Feet',
                symptoms: ['Symptom 1', 'Symptom 2', 'Symptom 3', 'Symptom 4', 'Symptom 5'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BodyPartButton extends StatelessWidget {
  final String bodyPart;
  final List<String> symptoms;

  const BodyPartButton({super.key, required this.bodyPart, required this.symptoms});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SymptomPage(
              bodyPart: bodyPart,
              symptoms: symptoms,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 147, 164, 202),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      ),
      child: Text(bodyPart),
    );
  }
}

class SymptomPage extends StatelessWidget {
  final String bodyPart;
  final List<String> symptoms;

  const SymptomPage({super.key, required this.bodyPart, required this.symptoms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$bodyPart Symptoms'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              for (String symptom in symptoms) ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 147, 164, 202),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                ),
                child: Text(symptom),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color.fromARGB(255, 147, 164, 202),
              //     foregroundColor: Colors.white,
              //     padding: const EdgeInsets.all(16.0),
              //   ),
              //   child: const Text('Back to Home'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
