import 'package:flutter/material.dart';
import 'package:symptom_checker/components/bodypart_components.dart';
import 'package:symptom_checker/utility/image_button_util.dart';
import 'package:symptom_checker/models/data_store.dart';
// import 'package:symptom_checker/utility/button_util.dart';
import 'package:symptom_checker/utility/footer_util.dart';
import 'package:symptom_checker/utility/grid_util.dart';

/// File contains classes related to the category pages
 
class CategoryButton extends StatelessWidget {
  final String category;
  const CategoryButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    return ImageButton(
      identifier: category,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              category: category,
            ),
          ),
        );
      },
    );
  }
}


class CategoryPage extends StatelessWidget {
  final String category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {

    List<Widget> bodyPartButtons = DataStore()
        .getBodyPartsByCategory(category)
        .map((bodypart) => BodyPartButton(category: category, bodypart: bodypart))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              Expanded(
                  child: TwoColumnGrid(children: [...bodyPartButtons]),
                ),
              const Footer()

            ],
          ),
        ),
      ),
    );
  }
}
