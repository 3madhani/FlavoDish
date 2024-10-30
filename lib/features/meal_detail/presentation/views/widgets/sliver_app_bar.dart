import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class ButtonSliverAppBar extends StatelessWidget {
  const ButtonSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: InkWell(
        onTap: () {
          GoRouter.of(context).pop();
        },
        child: const HugeIcon(
          size: 40,
          icon: HugeIcons.strokeRoundedArrowTurnBackward,
          color: Colors.black,
        ),
      ),
      expandedHeight: MediaQuery.sizeOf(context).height * 0.3,
      pinned: true,
      backgroundColor: Colors.transparent,
    );
  }
}
