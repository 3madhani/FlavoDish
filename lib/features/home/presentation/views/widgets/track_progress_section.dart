import 'package:flavodish/constants.dart';
import 'package:flavodish/utils/styles.dart';
import 'package:flutter/material.dart';

class TrackAndProgressSection extends StatelessWidget {
  const TrackAndProgressSection({
    super.key,
    required this.textLabel,
    required this.buttonLabel,
  });

  final String textLabel;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kPadding,
        right: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            textLabel,
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton.icon(
            iconAlignment: IconAlignment.end,
            style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.zero,
              ),
            ),
            onPressed: () {},
            label: Text(
              buttonLabel,
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.bold,
                color: kPrimaryTextColor,
              ),
            ),
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: kSecondaryTextColor,
              size: 14,
            ),
          )
        ],
      ),
    );
  }
}
