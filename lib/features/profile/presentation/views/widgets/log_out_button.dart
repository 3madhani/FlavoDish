import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavodish/core/utils/app_router.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      GoRouter.of(context).go(AppRouter.authRoute);
      // Optionally navigate to the login page or show a success message
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication errors

      _showErrorDialog(context, e.message ?? 'An unknown error occurred');
    } catch (e) {
      // Handle other possible errors

      _showErrorDialog(context, e.toString());
    } finally {
      // Close the loading dialog

      GoRouter.of(context).go(AppRouter.authRoute); // Closes the loading dialog
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out Failed'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), // Close the dialog
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _signOut(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Log out'.toUpperCase(),
              style: Styles.textStyle18,
            ),
            const SizedBox(width: 10),
            const Icon(
              HugeIcons.strokeRoundedLogout01,
              color: Colors.black,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
