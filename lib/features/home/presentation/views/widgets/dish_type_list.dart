import 'package:flavodish/constants.dart';
import 'package:flavodish/features/meals/presentation/views/meals_view.dart';
import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
import 'package:flutter/material.dart';

import 'dish_type.dart';

class CategorySectionList extends StatelessWidget {
  const CategorySectionList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: kPadding,
        right: kPadding,
      ),
      itemBuilder: (context, index) {
        return AnimatedOpenContainer(
            borderRadius: 100,
            closedWidget: DishType(
              dishType: dishTypeList[index],
              imageUrl: "assets/images/dinner.jpg",
            ),
            openedWidget:  MealsView(
              mealType: dishTypeList[index],
              dishType: dishTypeList[index],
            ));
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 12,
      ),
      itemCount: dishTypeList.length,
    );
  }
}
