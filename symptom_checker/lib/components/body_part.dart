import 'package:flutter/material.dart';
import 'package:symptom_checker/components/symptom.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

/// File contains classes related to the body part pages

// referred to from CategoryPage in components/category.dart 
class BodyPartButton extends StatelessWidget {
  final String category;
  final String bodypart;

  // (string) category, (string) bodypart are required inputs
  const BodyPartButton({super.key, required this.category, required this.bodypart});

  // define button with bodypart text
  // if pushed, goes to BodyPartPage
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BodyPartPage(
              category: category,
              bodypart: bodypart
            ),
          ),
        );
      },
      child: Text(bodypart),
    );
  }
}

// referred to from BodyPartButton
class BodyPartPage extends StatelessWidget {
  final String category;
  final String bodypart;

  // (string) category, (string) bodypart are required inputs
  const BodyPartPage({super.key, required this.category, required this.bodypart});

  // defines a column of SymptomButton(s) 
  // from components/symptom.dart
  // also has a HomeButton from utility/button_util.dart
  // that goes back to the home page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bodypart),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              for (String symptom in DataStore().getSymptomsByBodyPart(category, bodypart)) SymptomButton(
                symptom: symptom,
              ),
              const HomeButton(),
            ],
          ),
        ),
      ),
    );
  }
}
