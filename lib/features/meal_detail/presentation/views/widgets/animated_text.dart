import 'package:flutter/material.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;
  final String text = "Favorite Recipes";

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
        milliseconds: 500,
      ),
    );

    // Initialize animations for each character
    _animations = List.generate(text.length, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index / text.length,
            1.0,
            curve: Curves.easeInOutCubicEmphasized,
          ),
        ),
      );
    });

    // Start the animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(text.length, (index) {
        return FadeTransition(
          opacity: _animations[index],
          child: Text(
            text[index],
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.bold,
              color: kPrimaryTextColor,
              wordSpacing: 1.5,
              letterSpacing: 1.5,
            ),
          ),
        );
      }),
    );
  }
}
