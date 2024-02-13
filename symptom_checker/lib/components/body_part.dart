import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/components/image_container.dart';
// import 'package:symptom_checker/components/symptom.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';
// import 'package:symptom_checker/utility/button_util.dart';
import 'package:symptom_checker/utility/footer.dart';
import 'package:symptom_checker/utility/grid_util.dart';

/// File contains classes related to the body part pages

class BodyPartButton extends StatelessWidget {
  final String category;
  final String bodypart;

  const BodyPartButton({super.key, required this.category, required this.bodypart});

  @override
  Widget build(BuildContext context) {
    return ImageButton(
      identifier: bodypart,
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
    );
  }
}

class BodyPartPage extends StatelessWidget {
  final String category;
  final String bodypart;

  const BodyPartPage({super.key, required this.category, required this.bodypart});

  @override
  Widget build(BuildContext context) {

    List<Widget> symptomButtons = DataStore()
        .getSymptomsByBodyPart(category, bodypart)
        .map((symptom) => AddSymptomCard(symptom: symptom))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(bodypart),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Expanded(
                child: TwoColumnGrid(children: [...symptomButtons]),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddSymptomCard extends StatelessWidget {
  final String symptom;

  const AddSymptomCard({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ImageButton(
        identifier: symptom,
        onPressed: () {},
      ),
      IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Provider.of<SelectedSymptoms>(context, listen: false).addSymptom(symptom);
          },
        ),
    ]);
  }
}
