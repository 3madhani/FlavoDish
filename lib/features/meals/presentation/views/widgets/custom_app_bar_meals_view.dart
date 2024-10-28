import 'package:flavodish/constants.dart';
import 'package:flavodish/features/meals/presentation/views/widgets/list_of_cuisines.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomAppBarMealsView extends StatefulWidget {
  const CustomAppBarMealsView({
    super.key,
    this.mealType,
    this.dishType,
  });

  final String? mealType;
  final String? dishType;

  @override
  State<CustomAppBarMealsView> createState() => _CustomAppBarMealsViewState();
}

class _CustomAppBarMealsViewState extends State<CustomAppBarMealsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const HugeIcon(
                  size: 30,
                  icon: HugeIcons.strokeRoundedArrowTurnBackward,
                  color: kPrimaryTextColor,
                ),
              ),
              const Text(
                "Categories",
                style: Styles.textStyle20,
              ),
            ],
          ),
        ),
        ListOfCuisines(
          mealType: widget.mealType,
          dishType: widget.dishType,
        ),
      ],
    );
  }
}
