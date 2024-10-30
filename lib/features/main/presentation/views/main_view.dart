import 'package:flavodish/features/home/presentation/views/home_view.dart';
import 'package:flavodish/features/main/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:flavodish/features/profile/presentation/views/profile_view.dart';
import 'package:flavodish/features/meal_detail/presentation/views/favorite_view.dart';
import 'package:flavodish/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeView(),
    const SearchView(),
    const FavoriteRecipeView(),
    const ProfileView(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Pass the tap handler to update index
      ),
    );
  }
}
