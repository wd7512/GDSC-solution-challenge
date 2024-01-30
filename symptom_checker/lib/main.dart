import 'package:flutter/material.dart';
import 'package:symptom_checker/components/categories.dart';
import 'package:symptom_checker/models/datastore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Symptom Tracker',
      home: const HomePage(),
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              for (String category in DataStore().getAllCategories()) CategoryButton(category: category),
            ],
          ),
        ),
      ),
    );
  }
}
