import 'package:flavodish/constants.dart';
import 'package:flutter/material.dart';

import 'progress_card_indicator.dart';

class ProgressGridView extends StatelessWidget {
  const ProgressGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kPadding,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        child: GridView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            String category = progressCardMap.keys.elementAt(index);
            return ProgressCardIndicator(
              cardTitle: category,
              cardIcon: progressCardMap[category][0],
              primaryIndicatorColor: progressCardMap[category][3],
              secondaryIndicatorColor: progressCardMap[category][4],
              indicatorText: progressCardMap[category][1],
              indicatorPercentage: progressCardMap[category][2],
            );
          },
          itemCount: progressCardMap.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.4 / 3,
            crossAxisCount: 2,
            crossAxisSpacing: kPadding,
            mainAxisSpacing: kPadding,
          ),
        ),
      ),
    );
  }
}
