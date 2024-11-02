import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/authentication/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(50),
        ),
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(
              Iconsax.user,
              size: 50,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            user.name,
            style: Styles.textStyle20.copyWith(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            user.email,
            style: Styles.textStyle16.copyWith(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
