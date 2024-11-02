import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            HugeIcons.strokeRoundedFacebook02,
            size: 45,
            color: Colors.white38,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.03,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            HugeIcons.strokeRoundedLinkedin01,
            size: 45,
            color: Colors.white38,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.03,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            HugeIcons.strokeRoundedTwitter,
            size: 45,
            color: Colors.white38,
          ),
        ),
      ],
    );
  }
}
