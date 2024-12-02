import 'package:flavodish/constants.dart';
import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'list_view_meal_catagories.dart';
import 'dish_type_list.dart';
import 'category_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const CustomAppBar(),
              const SizedBox(
                height: 50,
              ),
              const CategorySection(
                textLabel: "Today Meals",
              ),
              Divider(
                thickness: 4,
                color: kPrimaryTextColor,
                indent: 20,
                endIndent: MediaQuery.sizeOf(context).width * 0.69,
              ),
              const SizedBox(
                height: 20,
              ),
              const ListViewMealCatagories(),
              const SizedBox(
                height: 25,
              ),
              const CategorySection(
                textLabel: "Dish Type",
              ),
              Divider(
                thickness: 4,
                color: kPrimaryTextColor,
                indent: 20,
                endIndent: MediaQuery.sizeOf(context).width * 0.75,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: DishTypeList(),
        ),
      ],
    );
  }
}
