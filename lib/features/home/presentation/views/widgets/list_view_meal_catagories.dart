import 'package:flavodish/constants.dart';
import 'package:flavodish/features/home/presentation/views/widgets/catagories_card.dart';
import 'package:flavodish/features/meals/presentation/views/meals_view.dart';
import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
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
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            itemCount: mealCatagoriesMap.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              // Get the keys and values from the map
              String category = mealCatagoriesMap.keys.elementAt(index);
              String imagePath = mealCatagoriesMap[category][0];

              // Return a FoodCard for each map entry
              return Padding(
                padding: const EdgeInsets.only(
                  right: kPadding,
                  bottom: 8,
                  top: 8,
                ),
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.blueAccent.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    )
                  ]),
                  child: AnimatedOpenContainer(
                    borderRadius: 16,
                    openedWidget: MealsView(
                      mealType: category,
                      dishType: null,
                    ),
                    closedWidget: Center(
                      child: CatagoriesCard(
                        imagePath: imagePath,
                        mealCatagories: category,
                        // color: cardColor,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
