import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

/*

  File contains classes related to the symptom pages

*/

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => {
                  Provider.of<SelectedSymptoms>(context, listen: false).addSymptom(symptom),
                },
                child: const Text('Add Symptom'),
              ),
              const HomeButton(),
            ],
          ),
        ),
      ),
    ); 
  }

}

