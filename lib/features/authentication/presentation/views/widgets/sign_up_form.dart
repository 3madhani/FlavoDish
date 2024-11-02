import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';

import 'custom_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onConfirmPasswordChanged, // New parameter
  });
  final GlobalKey<FormState> formKey;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onEmailChanged;
  final ValueChanged<String> onPasswordChanged;
  final ValueChanged<String> onConfirmPasswordChanged; // New parameter

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        right: MediaQuery.sizeOf(context).width * 0.12,
        left: MediaQuery.sizeOf(context).width * 0.12,
      ),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            CustomTextFormField(
              icon: Iconsax.user,
              hintText: "Name",
              isPassword: false,
              isEmail: false,
              onChange: onNameChanged,
            ),
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
            CustomTextFormField(
              icon: HugeIcons.strokeRoundedKey01,
              hintText: "Confirm Password",
              isPassword: true,
              isEmail: false,
              onChange: onConfirmPasswordChanged, // Use the new callback
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
