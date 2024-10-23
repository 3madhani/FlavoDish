import 'package:flavodish/constants.dart';
import 'package:flavodish/features/home/presentation/views/widgets/catagories_card.dart';
import 'package:flutter/material.dart';

class ListViewMealCatagories extends StatelessWidget {
  const ListViewMealCatagories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kPadding,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.21,
        child: ListView.builder(
            itemCount: mealCatagoriesMap.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // Get the keys and values from the map
              String category = mealCatagoriesMap.keys.elementAt(index);
              String imagePath = mealCatagoriesMap[category][0];

              // Return a FoodCard for each map entry
              return CatagoriesCard(
                imagePath: imagePath,
                mealCatagories: category,
                // color: cardColor,
              );
            }),
      ),
    );
  }
}
