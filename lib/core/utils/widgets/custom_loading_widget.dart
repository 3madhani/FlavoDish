import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMealsItem extends StatelessWidget {
  const ShimmerMealsItem({super.key, required this.height,});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      loop: 2,
      baseColor: Colors.white,
      highlightColor: Colors.grey,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
