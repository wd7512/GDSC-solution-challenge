import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:symptom_checker/models/selected_symptoms_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

/// File contains classes to do with symptom interaction

class AllSymptomsButton extends StatelessWidget{
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Symptoms'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              const HomeButton(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: _SymptomsList()
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _SymptomsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var symptomState = context.watch<SelectedSymptoms>();

    return ListView.builder(
      itemCount: symptomState.selectedSymptoms.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(symptomState.selectedSymptoms.elementAt(index)),
        trailing: IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            Provider.of<SelectedSymptoms>(context, listen: false).removeSymptom(symptomState.selectedSymptoms.elementAt(index));
          },
        ),
      ),
    );
  }
}
