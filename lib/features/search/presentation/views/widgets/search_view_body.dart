import 'package:flavodish/features/search/presentation/views/widgets/sliding_search_cards.dart';
import 'package:flutter/material.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

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
