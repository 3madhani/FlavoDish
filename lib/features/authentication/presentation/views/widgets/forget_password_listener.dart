import 'package:flavodish/features/authentication/manager/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';

class ForgotPasswordListener {
  static void handleState(BuildContext context, ForgotPasswordState state) {
    if (state is ForgotPasswordLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );
    } else if (state is ForgotPasswordSuccess) {
      Navigator.of(context).popUntil((route) => route.isFirst);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reset Password Email has been sent.')),
      );
    } else if (state is ForgotPasswordFailure) {
      Navigator.of(context).pop(); // Close the loading dialog
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage)),
      );
    }
  }
}
