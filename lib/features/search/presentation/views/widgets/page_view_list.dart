import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flavodish/features/meal_detail/presentation/views/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'searched_meal_card.dart';

class SearchedPageViewBody extends StatefulWidget {
  const SearchedPageViewBody({
    super.key,
    required this.searchedMeals,
  });

  final MealModel searchedMeals;

  @override
  State<SearchedPageViewBody> createState() => _SearchedPageViewBodyState();
}

class _SearchedPageViewBodyState extends State<SearchedPageViewBody> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.88,
    ); // Initialize a unique PageController
  }

  @override
  void dispose() {
    _pageController
        .dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.58,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController, // Use the local controller
        clipBehavior: Clip.none,
        itemCount: widget.searchedMeals.hits!.length,
        itemBuilder: (context, index) {
          return _buildPageItem(context, index);
        },
      ),
    );
  }

  Widget _buildPageItem(BuildContext context, int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double pageOffset = 0;
        if (_pageController.position.haveDimensions) {
          pageOffset = _pageController.page! - index;
        }
        double gauss =
            math.exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
        return Transform.translate(
          offset: Offset(-32 * gauss * pageOffset.sign, 0),
          child: Container(
            clipBehavior: Clip.none,
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent.withOpacity(0.2),
                  offset: const Offset(8, 20),
                  blurRadius: 24,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: AnimatedOpenContainer(
              borderRadius: 100,
              openedWidget: DetailsView(
                meal: widget.searchedMeals.hits![index].recipe!,
              ),
              closedWidget: SearchedMealCard(
                searchedMeal: widget.searchedMeals.hits![index].recipe!,
                alignment: Alignment(-pageOffset.abs(), 0),
              ),
            ),
          ),
        );
      },
    );
  }
}
