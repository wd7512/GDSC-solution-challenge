import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/utility/image_button_util.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';
import 'package:symptom_checker/utility/button_util.dart';
import 'package:symptom_checker/utility/grid_util.dart';

/// File contains classes to do with symptom interaction

class AllSymptomsButton extends StatelessWidget {
  const AllSymptomsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AllSymptomsPage(),
          ),
        );
      },
      child: const Text('All Symptoms'),
    );
  }
}

class AllSymptomsPage extends StatelessWidget {
  const AllSymptomsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var symptomState = context.watch<SelectedSymptoms>();
    List<Widget> symptomsWidgetList = symptomState.selectedSymptoms
        .map((symptom) => DeleteSymptomCard(symptom: symptom))
        .toList();
    final selectedSymptoms = Provider.of<SelectedSymptoms>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Symptoms'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Expanded(
                  child: AutoGrid(
                children: [...symptomsWidgetList],
              )),
              const HomeButton(),
              ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PdfPreviewPage(
                        selectedSymptoms: selectedSymptoms.selectedSymptoms,
                      ),
                    ),
                  );
                  // rootBundle.
                },
                child: const Text("Generate PDF"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteSymptomCard extends StatelessWidget {
  final String symptom;

  const DeleteSymptomCard({super.key, required this.symptom});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: ImageButton(
          identifier: symptom,
          onPressed: () {},
        ),
      ),
      IconButton(
        icon: const Icon(Icons.remove),
        onPressed: () {
          Provider.of<SelectedSymptoms>(context, listen: false)
              .removeSymptom(symptom);
        },
      ),
    ]);
  }
}
