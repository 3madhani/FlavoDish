import 'package:flavodish/features/main/presentation/views/widgets/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: const Offset(0, -10),
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 7,
        )
      ]),
      child: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: onItemTapped, // Handle taps
        items: [
          BottomNavigationBarItem(
            icon: AnimatedIconButton(
              icon: HugeIcons.strokeRoundedHome11,
              text: "Home",
              onTap: () => onItemTapped(0),
              index: 0,
              isSelected: currentIndex == 0,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: AnimatedIconButton(
              icon: HugeIcons.strokeRoundedSearch01,
              text: "Search",
              onTap: () => onItemTapped(1),
              index: 1,
              isSelected: currentIndex == 1,
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: AnimatedIconButton(
              icon: HugeIcons.strokeRoundedFavourite,
              text: "Favorite",
              onTap: () => onItemTapped(2),
              index: 2,
              isSelected: currentIndex == 2,
            ),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: AnimatedIconButton(
              icon: HugeIcons.strokeRoundedProfile02,
              text: "Profile",
              onTap: () => onItemTapped(3),
              index: 3,
              isSelected: currentIndex == 3,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
