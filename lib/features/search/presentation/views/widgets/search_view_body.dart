import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

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
    // BlocProvider.of<SearchedBooksCubit>(context).resetSearch();
  }

  @override
  Widget build(BuildContext context) {
    List<Container> cards = [
      Container(
        height: 100,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text('1'),
      ),
      Container(
        height: 100,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text('2'),
      ),
      Container(
        height: 100,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Text('3'),
      )
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const CustomSearchTextField(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.5, // Set a fixed height for the CardSwiper
              width: MediaQuery.of(context).size.height * 0.8,
              child: CardSwiper(
                controller: CardSwiperController(),
                scale: 0.85,
                backCardOffset: const Offset(0, -90),
                cardsCount: cards.length,
                cardBuilder: (
                  context,
                  index,
                  percentThresholdY,
                  percentThresholdX,
                ) =>
                    cards[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
