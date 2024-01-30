import 'package:flutter/material.dart';
import 'package:symptom_checker/components/body_part.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

class CategoryButton extends StatelessWidget {
  final String category;

  const CategoryButton({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              category: category
            ),
          ),
        );
      },
      child: Text(category),
    );
  }
}


class CategoryPage extends StatelessWidget {
  final String category;

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              for (String bodypart in DataStore().getBodyPartsByCategory(category)) BodyPartButton(
                category: category,
                bodypart: bodypart,
                ),
              const HomeButton()
            ],
          ),
        ),
      ),
    );
  }
}
