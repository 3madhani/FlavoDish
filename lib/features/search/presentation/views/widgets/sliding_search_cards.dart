import 'dart:math' as math;
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/core/utils/widgets/custom_error_widget.dart';
import 'package:flavodish/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flavodish/features/search/presentation/manager/searched_meals_cubit/searched_meals_cubit.dart';
import 'package:flavodish/features/search/presentation/views/widgets/searched_meal_card.dart';
import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
import 'package:flavodish/features/mealsView/presentation/views/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SlidingCardsView extends StatefulWidget {
  const SlidingCardsView({super.key});

  @override
  State<SlidingCardsView> createState() => _SlidingCardsViewState();
}

class _SlidingCardsViewState extends State<SlidingCardsView> {
  late PageController pageController;
  final int itemCount = 1; // Number of items in the carousel
  int currentPage = 1000; // Arbitrary large number to simulate infinite scroll

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: currentPage,
      viewportFraction: 0.75,
    );

    // Start a timer to auto-scroll
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedMealsCubit, SearchedMealsState>(
      builder: (context, state) {
        if (state is SearchedMealsInitial) {
          // Show an empty state or message
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search,
                size: 64,
                color: kPrimaryTextColor,
              ),
              Text(
                'Start searching for Meals!',
                style: Styles.textStyle18,
              ),
            ],
          );
        } else if (state is SearchedMealsSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: PageView.builder(
              clipBehavior: Clip.none,
              controller: pageController,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double pageOffset = 0;
                    if (pageController.position.haveDimensions) {
                      pageOffset = pageController.page! - index;
                    }
                    double gauss = math
                        .exp(-(math.pow((pageOffset.abs() - 0.5), 2) / 0.08));
                    return Transform.translate(
                      offset: Offset(-32 * gauss * pageOffset.sign, 0),
                      child: Container(
                        clipBehavior: Clip.none,
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(8, 20),
                              blurRadius: 24,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: AnimatedOpenContainer(
                          borderRadius: 100,
                          openedWidget: DetailsView(
                            meal: state.searchedMeals.hits![index].recipe!,
                          ),
                          closedWidget: SearchedMealCard(
                            meal: state.searchedMeals.hits![index].recipe!,
                            alignment: Alignment(-pageOffset.abs(), 0),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          );
        } else if (state is SearchedMealsFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: PageView.builder(
              clipBehavior: Clip.none,
              controller: pageController,
              itemBuilder: (context, index) {
                return const ShimmerMealsItem();
              },
            ),
          );
        }
      },
    );
  }
}
