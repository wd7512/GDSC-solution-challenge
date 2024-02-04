import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/components/category.dart';
import 'package:symptom_checker/components/selected_symptoms.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';

// main execution loop
void main() { 
  runApp(const MyApp());
}

// Define stateless widget to hold the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedSymptoms()),
      ],
      child: MaterialApp(
        title: 'Symptom Tracker',
        home: const HomePage(),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 147, 164, 202)),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 147, 164, 202),
          ),
        ),
      ),
    );
  }
}

// the home page from MyApp
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // scaffold contains the structure of the home page
    return Scaffold(
      // bar at the top of the page
      appBar: AppBar(
        title: const Text('Symptom Checker'),
      ),
      // main section
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          // column of buttons for each body part
          // refers to CategoryButton in compoments/category.dart
          // taking the (string) category name as inputs
          // has a final button AllSymptomsButtom
          // from components/selected_symptoms.dart
          child: Column(
            children: [
              for (String category in DataStore().getAllCategories()) CategoryButton(category: category),
              const AllSymptomsButton()
            ],
          ),
        ),
      ),
    );
  }
}
