import 'package:flavodish/core/utils/widgets/custom_error_widget.dart';
import 'package:flavodish/core/utils/widgets/custom_loading_widget.dart';
import 'package:flavodish/features/search/presentation/manager/searched_meals_cubit/searched_meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'empty_search_list.dart';
import 'page_view_list.dart';

class SlidingCardsView extends StatelessWidget {
  const SlidingCardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedMealsCubit, SearchedMealsState>(
      builder: (context, state) {
        if (state is SearchedMealsInitial) {
          // Show an empty state or message
          return const EmptySearchView();
        } else if (state is SearchedMealsSuccess) {
          return SearchedPageViewBody(
            searchedMeals: state.searchedMeals,
          );
        } else if (state is SearchedMealsFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: PageView.builder(
              clipBehavior: Clip.none,
              controller: PageController(
                viewportFraction: 0.88,
              ),
              itemBuilder: (context, index) {
                return ShimmerMealsItem(
                  height: MediaQuery.of(context).size.height * 0.55,
                );
              },
            ),
          );
        }
      },
    );
  }
}
