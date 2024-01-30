import 'package:flutter/material.dart';
import 'package:symptom_checker/components/symptom.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

/*

  File contains classes related to the body part pages

*/

class BodyPartButton extends StatelessWidget {
  final String category;
  final String bodypart;

  const BodyPartButton({super.key, required this.category, required this.bodypart});

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


class BodyPartPage extends StatelessWidget {
  final String category;
  final String bodypart;

  const BodyPartPage({super.key, required this.category, required this.bodypart});

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
