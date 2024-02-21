import 'package:flutter/material.dart';

class AutoGrid extends StatelessWidget {
  final List<Widget> children;
  final int columnCount;

  const AutoGrid({super.key, required this.children, this.columnCount = 2});

  @override
  Widget build(BuildContext context) {
    
    double screenWidth = MediaQuery.of(context).size.width;
    int columnCount = (screenWidth / 170).floor(); 
    double maxWidth = screenWidth-(screenWidth/10).floor();

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: columnCount,
        // childAspectRatio: (maxWidth/500),
        children: children,
      ),
    );
  }
}
