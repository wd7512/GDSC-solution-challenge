import 'package:flutter/material.dart';
import 'package:symptom_checker/utility/button_util.dart';

class SymptomButton extends StatelessWidget {
  final String symptom;

  const SymptomButton({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SymptomPage(
              symptom: symptom,
            ),
          ),
        );
      },
      child: Text(symptom),
    );
  }
}

class SymptomPage extends StatelessWidget {
  final String symptom;

  const SymptomPage({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symptom),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              // TODO: add image of symptom
              // TODO: add button that will add symptom to list of all symptoms
              HomeButton()
            ],
          ),
        ),
      ),
    ); 
  }

}
