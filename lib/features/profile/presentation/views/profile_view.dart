import 'package:flavodish/features/meal_detail/presentation/views/widgets/animated_text.dart';
import 'package:flavodish/features/profile/presentation/views/widgets/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      titleSpacing: 2,
      shadowColor: Colors.blueAccent.withOpacity(0.1),
      title: const AnimatedText(
        text: "User Profile",
      ),
      centerTitle: true,
    );
    return Scaffold(
      appBar: appBar,
      body: const UserProfileView(),
    );
  }
}
