import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/meals/presentation/manager/dish_type_meals_cubit/dish_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/manager/meal_type_meals_cubit/meal_type_meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfCuisines extends StatefulWidget {
  const ListOfCuisines({super.key, this.mealType, this.dishType});
  final String? mealType;
  final String? dishType;

  @override
  State<ListOfCuisines> createState() => _ListOfCuisinesState();
}

class _ListOfCuisinesState extends State<ListOfCuisines> {
  int _selectedIndex = -1; // Initial index to underline the first item
  String? _cuisineType;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _cuisineType = cuisineTypeList[index];
    });

    if (widget.dishType != null) {
      context.read<DishTypeMealsCubit>().getMealsDependingOnDishType(
            cuisineType: _cuisineType,
            dishType: widget.dishType!,
          );
    } else if (widget.mealType != null) {
      context.read<MealTypeMealsCubit>().getMealsDependingOnMealType(
            cuisineType: _cuisineType,
            mealType: widget.mealType!,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.05, // Updated here
        child: ListView.builder(
            itemCount: cuisineTypeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 6,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == index
                        ? kPrimaryTextColor
                        : const Color.fromARGB(255, 196, 217, 242),
                  ),
                  onPressed: () {
                    _onItemTapped(index);
                  },
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    cuisineTypeList[index],
                    style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.w600,
                      color: _selectedIndex == index
                          ? Colors.white
                          : Colors.black54,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
