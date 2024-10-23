import 'package:flavodish/constants.dart';
import 'package:flavodish/utils/styles.dart';
import 'package:flutter/material.dart';

class AnimatedIconButton extends StatelessWidget {
  const AnimatedIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.index,
    required this.isSelected, // New parameter to track selection
  });

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final int index;
  final bool isSelected;

  // Track whether this button is selected
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AnimatedContainer(
        curve: Curves.linearToEaseOut,
        width: isSelected ? 150 : 50,
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? kPrimaryTextColor : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  icon,
                  size: 26,
                  color: isSelected ? kPrimaryTextColor : Colors.grey,
                ),
              ),
              // Space between icon and text
              if (isSelected)
                Flexible(
                  child: Text(
                    text,
                    style: Styles.textStyle16.copyWith(
                      color: kSecondaryTextColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
