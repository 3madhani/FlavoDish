import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'list_view_meal_catagories.dart';
import 'progress_grid_view.dart';
import 'track_progress_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 50,
        ),
        CustomAppBar(),
        SizedBox(
          height: 50,
        ),
        TrackAndProgressSection(
          textLabel: "Todays Meals",
          buttonLabel: "Track Food",
        ),
        SizedBox(
          height: 20,
        ),
        ListViewMealCatagories(),
        SizedBox(
          height: 25,
        ),
        TrackAndProgressSection(
          textLabel: "Progress Last Week",
          buttonLabel: "Current",
        ),
        ProgressGridView(),
        
      ],
    ));
  }
}
