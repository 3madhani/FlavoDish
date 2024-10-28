import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.meal,
  });

  final Recipe meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(
        recipe: meal,
      ),
    );
  }
}
