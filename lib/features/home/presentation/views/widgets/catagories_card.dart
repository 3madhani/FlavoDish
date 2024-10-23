import 'package:flavodish/constants.dart';
import 'package:flavodish/utils/styles.dart';
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
    return Padding(
      padding: const EdgeInsets.only(right: kPadding),
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                mealCatagories,
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
