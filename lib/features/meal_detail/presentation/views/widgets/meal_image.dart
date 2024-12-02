import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MealImage extends StatelessWidget {
  const MealImage({
    super.key,
    required this.mealImage,
  });

  final String mealImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: MediaQuery.sizeOf(context).height * .4,
      imageUrl: mealImage,
      fit: BoxFit.cover,
      width: double.infinity,
      errorWidget: (context, url, error) => const Icon(
        HugeIcons.strokeRoundedRssError,
        size: 60,
      ),
    );
  }
}
