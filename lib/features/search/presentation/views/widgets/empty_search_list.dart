import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          HugeIcons.strokeRoundedSearchMinus,
          size: 250,
          color: kPrimaryTextColor,
          weight: 20,
        ),
        const SizedBox(height: 20),
        Text(
          'Start searching for Meals!',
          style: Styles.textStyle30.copyWith(
            fontSize: 28,
          ),
        ),
      ],
    );
  }
}
