import 'dart:math';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DishType extends StatelessWidget {
  const DishType({
    super.key,
    required this.dishType,
    required this.imageUrl,
  });

  final String dishType;
  final String imageUrl;

  LinearGradient getRandomCircularGradient() {
    final Random random = Random();

    Color getRandomColor() {
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    return LinearGradient(
      colors: [
        getRandomColor(),
        getRandomColor(),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  Color getRandomTextColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // Opacity (255 for fully opaque)
      random.nextInt(256), // Red
      random.nextInt(256), // Green
      random.nextInt(256), // Blue
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    final screenSize = MediaQuery.sizeOf(context);

    return Container(
      width: screenSize.width * 0.25, // Adjust width based on screen size
      height: screenSize.width * 0.25,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: getRandomCircularGradient(),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Center(
          child: Padding(
            padding:
                EdgeInsets.all(screenSize.width * 0.02), // Responsive padding
            child: Text(
              dishType,
              textAlign: TextAlign.center,
              style: Styles.textStyle20.copyWith(
                fontSize: screenSize.width * 0.047, // Responsive font size
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                wordSpacing: 1.2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
