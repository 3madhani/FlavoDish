import 'package:flavodish/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressCardIndicator extends StatelessWidget {
  const ProgressCardIndicator({
    super.key,
    required this.cardTitle,
    required this.cardIcon,
    required this.primaryIndicatorColor,
    required this.secondaryIndicatorColor,
    required this.indicatorText,
    required this.indicatorPercentage,
  });

  final String cardTitle;
  final String cardIcon;
  final Color primaryIndicatorColor;
  final Color secondaryIndicatorColor;
  final String indicatorText;
  final double indicatorPercentage;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardTitle,
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SvgPicture.asset(
                  cardIcon,
                  height: 26,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                shape: BoxShape.circle, // To make the shadow circular
                boxShadow: [
                  BoxShadow(
                    color: secondaryIndicatorColor
                        .withOpacity(0.2), // Shadow color with opacity
                    spreadRadius: 6, // How much the shadow spreads
                    blurRadius: 6, // How soft the shadow is
                    offset: const Offset(0, 3), // Shadow position (x, y)
                  ),
                ],
              ),
              child: CircularPercentIndicator(
                animation: true,
                backgroundWidth: 6,
                animateFromLastPercent: true,
                radius: 58.0,
                lineWidth: 8.0,
                percent: indicatorPercentage, // 75% progress
                circularStrokeCap: CircularStrokeCap.round,
                reverse: true,
                startAngle: 90,
                backgroundColor: secondaryIndicatorColor.withOpacity(0.4),
                rotateLinearGradient: true,
                linearGradient: LinearGradient(
                  colors: [
                    primaryIndicatorColor,
                    secondaryIndicatorColor.withOpacity(.6),
                    primaryIndicatorColor,
                  ],
                ),
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      indicatorText,
                      style: Styles.textStyle18.copyWith(
                        color: primaryIndicatorColor,
                      ),
                    ),
                    Text(
                      "${(indicatorPercentage * 100).toInt()}%",
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
