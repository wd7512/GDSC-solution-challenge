import 'package:flutter/material.dart';

/// State Management for the symptoms

// referred to from SymptomPage in components/symptom.dart
// contains the selected symptoms with functions 
// addSymptom to append a (string) symptom
// removeSymptom to remove (string) symptom
class SelectedSymptoms extends ChangeNotifier {
  final Set<String> symptoms = <String>{};

  List<String> get selectedSymptoms => symptoms.toList();

  void addSymptom(String symptom) {
    symptoms.add(symptom);
    notifyListeners();
  }

  void removeSymptom(String symptom) {
    symptoms.remove(symptom);
    notifyListeners();
  }
}
