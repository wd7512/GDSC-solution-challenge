import 'package:flutter/material.dart';

// Reusable button component for returning home from any page
class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      child: const Text('Back to Home'),
    );
  }
}
