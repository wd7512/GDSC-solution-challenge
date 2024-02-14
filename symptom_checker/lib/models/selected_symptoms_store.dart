import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

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

Future<Uint8List> createPdf(List<String> selectedSymptoms) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Selected Symptoms:'),
            for (var symptom in selectedSymptoms) pw.Text('- $symptom'),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

class PdfPreviewPage extends StatelessWidget {
  final List<String> selectedSymptoms;
  const PdfPreviewPage({Key? key, required this.selectedSymptoms})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => createPdf(selectedSymptoms),
      ),
    );
  }
}
