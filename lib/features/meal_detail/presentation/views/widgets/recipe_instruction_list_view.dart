import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RecipeInstructionsListView extends StatelessWidget {
  const RecipeInstructionsListView({
    super.key,
    required this.instructions,
  });

  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.only(
            left: 18, right: 18), // Added right padding for symmetry
        itemCount: instructions.length,
        itemBuilder: (context, index) => Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Align icons and text
          children: [
            const Icon(
              Icons.circle,
              color: kPrimaryTextColor,
              size: 10,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 6.0),
                child: Text(
                  instructions[index],
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.normal,
                    wordSpacing: 2,
                    letterSpacing: 1,
                    fontSize: MediaQuery.sizeOf(context).width *
                        0.035, // Adaptive font size
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
