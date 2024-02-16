import 'package:flutter/material.dart';
import 'package:symptom_checker/utility/footer_util.dart';
import 'package:symptom_checker/models/settings_store.dart';

// setting page for accesibility settings
// currently has one button with colorblind mode
// the intent is that this variable within settings_page.dart
// will determine what images are shown

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // You can add functionality here if needed
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    SettingsStore.isColorBlind = !SettingsStore.isColorBlind;
                    // print(SettingsStore.isColorBlind);
                  });
                },
                child: Text(
                  SettingsStore.isColorBlind ? 'Disable Color Blind Mode' : 'Enable Color Blind Mode',
                  style: TextStyle(
                    fontSize: SettingsStore.textSize,
                  ),
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
