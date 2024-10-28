import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    super.key,
    required this.textLabel,
  });

  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kPadding,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textLabel,
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
