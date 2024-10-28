import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimatedOpenContainer extends StatelessWidget {
  const AnimatedOpenContainer(
      {super.key,
      required this.openedWidget,
      required this.closedWidget,
      required this.borderRadius});
  final Widget openedWidget;
  final Widget closedWidget;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    const transitionType = ContainerTransitionType.fadeThrough;
    return OpenContainer(
      openElevation: 3,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      transitionType: transitionType,
      transitionDuration: const Duration(
        seconds: 1,
        milliseconds: 500,
      ),
      openBuilder: (context, _) => openedWidget,
      closedBuilder: (context, VoidCallback openContainer) => closedWidget,
    );
  }
}
