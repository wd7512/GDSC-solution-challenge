import 'package:flutter/material.dart';

class TwoColumnGrid extends StatelessWidget {
  final List<Widget> children;
  final int columnCount;

  const TwoColumnGrid({super.key, required this.children, this.columnCount = 2});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: columnCount,
      children: children,
    );
  }
}
