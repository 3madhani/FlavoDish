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
          left: 18,
        ),
        itemCount: instructions.length,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.circle,
                color: kPrimaryTextColor,
                size: 10,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  instructions[index],
                  style: Styles.textStyle16.copyWith(
                      fontWeight: FontWeight.normal,
                      wordSpacing: 2,
                      letterSpacing: 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
