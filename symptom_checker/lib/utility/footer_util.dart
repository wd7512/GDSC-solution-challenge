import 'package:flutter/material.dart';
import 'package:symptom_checker/components/selected_symptoms_components.dart';
import 'package:symptom_checker/utility/button_util.dart';

// Reusable component for footer

class Footer extends StatelessWidget {
  const Footer({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HomeButton(),
        AllSymptomsButton(),
      ],
    );
  }
}
