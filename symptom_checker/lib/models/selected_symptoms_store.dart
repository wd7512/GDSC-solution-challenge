import 'package:flutter/material.dart';

/// State Management for the symptoms

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
