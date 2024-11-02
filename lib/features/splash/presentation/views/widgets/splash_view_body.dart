import 'package:flavodish/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flavodish/core/utils/app_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and Sliding Animation
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ));

    // Start the sliding animation
    animationController.forward();

    // Navigate to the home screen after 3 seconds
    navigateToHome();
  }

  void navigateToHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 4),
        () {
          if (mounted) {
            // Navigate to the auth route after the splash screen
            GoRouter.of(context).go(AppRouter.authRoute);
          }
        },
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose(); // Dispose of the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SlideTransition(
        position: slidingAnimation,
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                textAlign: TextAlign.center,
                'FLAVODISH',
                textStyle: const TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2,
                  wordSpacing: 3.0,
                  color: logInBg,
                  fontFamily: 'Horizon',
                ),
                speed: const Duration(milliseconds: 300),
              ),
            ],
            totalRepeatCount: 2,
            pause: const Duration(milliseconds: 500),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
        ),
      ),
    );
  }
}
