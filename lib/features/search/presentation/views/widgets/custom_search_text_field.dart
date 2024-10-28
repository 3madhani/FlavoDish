import 'package:flavodish/constants.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a TextEditingController to manage the text field input
    final TextEditingController searchController = TextEditingController();

    return TextField(
      onTap: () {
        final query = searchController.text.trim(); // Get the search query
        if (query.isNotEmpty) {
          // Only fetch if the query is not empty
          // BlocProvider.of<SearchedBooksCubit>(context).fetchSearchBooks(
          //   query: query, // Pass the query to the cubit
          // );
        }
      },
      controller: searchController, // Assign the controller to the TextField
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            final query = searchController.text.trim(); // Get the search query
            // if (query.isNotEmpty) {
            //   // Only fetch if the query is not empty
            //   BlocProvider.of<SearchedBooksCubit>(context).fetchSearchBooks(
            //     query: query, // Pass the query to the cubit
            //   );
            // }
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
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}
