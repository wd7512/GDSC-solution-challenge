import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

/// File contains classes related to the symptom pages

// referred to from BodyPartPage in components/body_part.dart 
class SymptomButton extends StatelessWidget {
  final String symptom;

  // (string) symptom is a required input
  const SymptomButton({super.key, required this.symptom});

  // define button with symptom text
  // if pushed, goes to SymptomPage
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
      child: SizedBox(
        height: 150,
        width: 150,
        child: ClipOval( //crop image to oval
          child: Image.asset("assets/$symptom.jpg", //add symptom image

            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// is SymptomPage necessary?
// if a symptom is selected it should just be added no? 
// on the contrary the final page for this could be a
// larger image of the symptom with a X or {tick} symbol?

// referred to from SymptomButton
class SymptomPage extends StatelessWidget {
  final String symptom;

  // (string) symptom is a required input
  const SymptomPage({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(symptom), // name of symptom at the top of the screen
      ),
      // adds a button to confirm selection of symptom
      // if pressed, adds symptom to SelectedSymptoms
      // from models/selected_symptoms_store.dart
      // adds HomeButton from utility/button_util.dart
      // if pressed, goes back to home page
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

