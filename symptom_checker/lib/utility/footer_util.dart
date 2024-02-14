import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/components/selected_symptoms_components.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

// Reusable component for footer

class Footer extends StatelessWidget {
  const Footer({Key? key});

  @override
  Widget build(BuildContext context) {
    final selectedSymptoms = Provider.of<SelectedSymptoms>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HomeButton(),
        const AllSymptomsButton(),
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
    );
  }
}
