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

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: AssetImage(
        imageUrl,
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          dishType,
          style: Styles.textStyle20.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 2,
                offset: const Offset(0, 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
