import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/search/presentation/manager/searched_meals_cubit/searched_meals_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});


  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return TextField(
      onTap: () {
        final query = searchController.text.trim(); // Get the search query
        if (query.isNotEmpty) {
          // Only fetch if the query is not empty
          BlocProvider.of<SearchedMealsCubit>(context).getSearchedMeals(
            query: query, // Pass the query to the cubit
          );
        }
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          // Only fetch if the query is not empty
          BlocProvider.of<SearchedMealsCubit>(context).getSearchedMeals(
            query: value, // Pass the query to the cubit
          );
        }
      },
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          BlocProvider.of<SearchedMealsCubit>(context).getSearchedMeals(
            query: value, // Pass the query to the cubit
          );
        }
      },
      cursorColor: kPrimaryTextColor,

      style: Styles.textStyle16.copyWith(
        color: kPrimaryTextColor,
        fontWeight: FontWeight.normal,
      ),
      controller: searchController, // Assign the controller to the TextField
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            final query = searchController.text.trim(); // Get the search query
            if (query.isNotEmpty) {
              // Only fetch if the query is not empty
              BlocProvider.of<SearchedMealsCubit>(context).getSearchedMeals(
                query: query, // Pass the query to the cubit
              );
            }
          },
          icon: Icon(
            HugeIcons.strokeRoundedSearch01,
            color: kPrimaryTextColor.withOpacity(0.8),
            size: 24,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: kPrimaryTextColor,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
