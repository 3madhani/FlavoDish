import 'package:flavodish/constants.dart';
import 'package:flavodish/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kPadding,
        right: kPadding,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: Styles.textStyle20.copyWith(
                    fontSize: 26,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Welcome Back,",
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w900,
                        color: const Color.fromARGB(255, 123, 127, 133),
                      ),
                    ),
                    Text(
                      " Arnob",
                      style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.w900,
                        color: kPrimaryTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const CircleAvatar(
              backgroundColor: kPrimaryTextColor,
              radius: 24,
            )
          ]),
    );
  }
}
