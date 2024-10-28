import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ListOfCuisines extends StatefulWidget {
  const ListOfCuisines({super.key,  this.mealType, this.dishType});
  final String? mealType;
  final String? dishType;


  @override
  State<ListOfCuisines> createState() => _ListOfCuisinesState();
}

class _ListOfCuisinesState extends State<ListOfCuisines> {
  int _selectedIndex = -1; // Initial index to underline the first item
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // _subject = booksType[index];
    });
    // final String selectedBookType = widget.booksType[index];
    // context
    //     .read<NewestBooksCubit>()
    //     .fetchNewestBooks(subject: selectedBookType);

    // context
    //     .read<FeaturedBooksCubit>()
    //     .fetchFeatureBooks(subject: selectedBookType);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.05,
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
                  overflow: TextOverflow.clip,
                  cuisineTypeList[index],
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w600,
                    color:
                        _selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
