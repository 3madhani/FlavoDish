import 'package:flavodish/features/search/presentation/manager/searched_meals_cubit/searched_meals_cubit.dart';
import 'package:flavodish/features/search/presentation/views/widgets/sliding_search_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {

  @override
  void initState() {
    super.initState();
    // Reset search state when this screen is initialized
    BlocProvider.of<SearchedMealsCubit>(context).resetSearch();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const CustomSearchTextField(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.12,
            ),
            const SlidingCardsView(),
          ],
        ),
      ),
    );
  }
}
