import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/authentication/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:flavodish/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void verifyEmail() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      context
          .read<ForgotPasswordCubit>()
          .sendPasswordResetEmail(emailController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 60),
              SizedBox(
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
                        color: signUpBg,
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
              const SizedBox(height: 40),
              Text(
                'You will receive an email to\nreset your password.',
                textAlign: TextAlign.center,
                style: Styles.textStyle20.copyWith(
                  fontSize: 24,
                  color: Colors.white54,
                ),
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                icon: HugeIcons.strokeRoundedMail01,
                hintText: "Email",
                isPassword: false,
                isEmail: true,
                onChange: (email) {
                  emailController.text = email;
                },
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: verifyEmail,
                child: Text(
                  "RESET PASSWORD",
                  style: Styles.textStyle20.copyWith(
                    color: Colors.white54,
                    fontSize: 36,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
