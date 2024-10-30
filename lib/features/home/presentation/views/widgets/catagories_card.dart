import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CatagoriesCard extends StatelessWidget {
  const CatagoriesCard({
    super.key,
    required this.imagePath,
    required this.mealCatagories,
  });

  final String imagePath;
  final String mealCatagories;
  // final Color color;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                textAlign: TextAlign.center,
                mealCatagories,
                style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
        ],
      ),
    );
  }
}
