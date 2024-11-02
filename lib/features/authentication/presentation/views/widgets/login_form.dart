import 'package:flavodish/core/utils/app_router.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.formKey,
    required this.onEmailChanged,
    required this.onPasswordChanged,
  });

  final GlobalKey<FormState> formKey;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        right: MediaQuery.sizeOf(context).width * 0.12,
        left: MediaQuery.sizeOf(context).width *
            0.12, // Adds padding for keyboard height
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            CustomTextFormField(
              icon: HugeIcons.strokeRoundedMail01,
              hintText: "Email",
              isPassword: false,
              isEmail: true,
              onChange: onEmailChanged,
            ),
            CustomTextFormField(
              icon: HugeIcons.strokeRoundedKey01,
              hintText: "Password",
              isPassword: true,
              isEmail: false,
              onChange: onPasswordChanged,
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(AppRouter.forgetPasswordRoute);
              },
              child: Text(
                "Forgot Password?",
                style: Styles.textStyle16.copyWith(
                  color: Colors.white,
                  letterSpacing: 1.2,
                  wordSpacing: 1.1,
                ),
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
