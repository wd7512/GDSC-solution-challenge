import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:symptom_checker/components/body_selector.dart';
import 'package:symptom_checker/components/category_components.dart';
import 'package:symptom_checker/components/selected_symptoms_components.dart';
// import 'package:symptom_checker/components/category.dart';
// import 'package:symptom_checker/components/selected_symptoms.dart';
import 'package:symptom_checker/models/data_store.dart';
// import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';
// import 'package:symptom_checker/utility/footer.dart';
import 'package:symptom_checker/utility/grid_util.dart';

void main() {
  runApp(const MyApp());
}

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
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 147, 164, 202)),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 147, 164, 202),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> categoryButtons = DataStore()
        .getAllCategories()
        .map((category) => CategoryButton(category: category))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Symptom Checker'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Expanded(
                child: AutoGrid(children: [...categoryButtons]),
              ),
              const AllSymptomsButton(),
            ],
          ),
        ),
      ),
    );
  }
}
