import 'dart:math';

import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class LoginAnimatedTextButton extends StatefulWidget {
  const LoginAnimatedTextButton({
    super.key,
    required this.isSignUp,
    this.onTap,
    required this.animationTextRotate,
    // required this.formKey,
  });
  final bool isSignUp;
  final Animation<double> animationTextRotate;
  final VoidCallback? onTap;
  // final GlobalKey<FormState> formKey;

  @override
  State<LoginAnimatedTextButton> createState() =>
      _LoginAnimatedTextButtonState();
}

class _LoginAnimatedTextButtonState extends State<LoginAnimatedTextButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AnimatedPositioned(
      duration: defaultDuration,
      bottom: widget.isSignUp ? size.height / 2 - 100 : size.height * 0.3,
      left: widget.isSignUp ? 0 : size.width * 0.44 - 80,
      child: AnimatedDefaultTextStyle(
        duration: defaultDuration,
        style: Styles.textStyle30.copyWith(
          fontFamily: '',
          fontSize: widget.isSignUp ? 20 : 32,
          fontWeight: FontWeight.w900,
          color: widget.isSignUp ? Colors.white : Colors.white60,
          letterSpacing: 1.2,
        ),
        child: Transform.rotate(
          alignment: Alignment.topLeft,
          angle: -widget.animationTextRotate.value * pi / 180,
          child: InkWell(
            onTap: widget.onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: defaultPadding * 0.75,
              ),
              width: 160,
              child: Text(
                textAlign: TextAlign.center,
                "Log In".toUpperCase(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
