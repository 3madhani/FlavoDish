// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';

import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
import 'package:flavodish/features/meal_detail/presentation/views/details_view.dart';

import 'card_of_meals_body.dart';

class VibrationCard extends StatefulWidget {
  const VibrationCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  State<VibrationCard> createState() => _VibrationCardState();
}

class _VibrationCardState extends State<VibrationCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Duration of the vibration
      vsync: this,
    )..repeat(reverse: true); // Repeat the animation

    _animation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 25,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(_animation.value, 0), // Left-right movement
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.17,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(24),
                ),
                color: kScaffoldColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: AnimatedOpenContainer(
                openedWidget: DetailsView(
                  meal: widget.recipe,
                ),
                borderRadius: 24,
                closedWidget: CardOfMealsBody(
                  recipe: widget.recipe,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
