import 'package:flavodish/constants.dart';
import 'package:flavodish/features/meals/presentation/views/meals_view.dart';
import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
import 'package:flutter/material.dart';

import 'dish_type.dart';

class DishTypeList extends StatelessWidget {
  const DishTypeList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      // physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        top: kPadding,
        left: kPadding,
        right: kPadding,
        bottom: kPadding,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: AnimatedOpenContainer(
              borderRadius: 200,
              closedWidget: DishType(
                dishType: dishTypeList[index],
                imageUrl: "assets/images/m8jv_cqpj_201128.jpg",
              ),
              openedWidget: MealsView(
                mealType: dishTypeList[index],
                dishType: dishTypeList[index],
              )),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: dishTypeList.length,
    );
  }
}
