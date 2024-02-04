import 'package:flutter/material.dart';
import 'package:symptom_checker/components/body_part.dart';
import 'package:symptom_checker/models/data_store.dart';
import 'package:symptom_checker/utility/button_util.dart';

/// File contains classes related to the category pages
 
// referred to from HomePage in main.dart
class CategoryButton extends StatelessWidget {
  final String category;
  // (string) category is a required input
  const CategoryButton({super.key, required this.category});

  // defines button with category as text
  // if pushed, goes to CategoryPage
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

// referred to from CategoryButton 
class CategoryPage extends StatelessWidget {
  final String category;
  // (string) category is a required input
  const CategoryPage({super.key, required this.category});

  // defines a column of BodyPartButton(s) 
  // from components/body_part.dart
  // also has a HomeButton from utility/button_util.dart
  // that goes back to the home page
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
