import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavodish/features/authentication/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignUpLoading());
    try {
      // Check if the email is already in use
      final emailExists = await _checkEmailExists(email);
      if (emailExists) {
        emit(const SignUpFailure(
            errMessage: 'The account already exists for that email.'));
        return;
      }

      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set(UserModel(email: email, name: name).toJson());

      // Send email verification
      await userCredential.user!.sendEmailVerification();

      emit(SignUpEmailVerificationSent());

      // Automatically check for email verification
      await _checkEmailVerification(userCredential.user!, email, password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const SignUpFailure(
            errMessage: 'The password provided is too weak.'));
      } else {
        emit(SignUpFailure(errMessage: e.message ?? 'An error occurred'));
      }
    } catch (e) {
      emit(const SignUpFailure(errMessage: 'An unexpected error occurred.'));
    }
  }

  Future<bool> _checkEmailExists(String email) async {
    try {
      final user =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      return user.isNotEmpty;
    } catch (e) {
      return false; // Handle error if necessary
    }
  }

  Future<void> _checkEmailVerification(
      User user, String email, String password) async {
    // Polling to check email verification status
    while (!user.emailVerified) {
      await Future.delayed(const Duration(seconds: 10)); // Wait for 10 seconds
      await user.reload(); // Reload user to get updated info
    }

    // If we reach this point, the email is verified
    try {
      // Automatically log in the user after verification
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SignUpSuccess()); // Emit success state
    } catch (e) {
      emit(const SignUpFailure(
          errMessage: 'Failed to log in after verification.'));
    }
  }
}
