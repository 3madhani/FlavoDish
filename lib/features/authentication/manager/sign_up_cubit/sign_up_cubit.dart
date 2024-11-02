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

      emit(
          SignUpEmailVerificationSent()); // Emit this state after sending the verification email
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const SignUpFailure(
            errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(const SignUpFailure(
            errMessage: 'The account already exists for that email.'));
      } else {
        emit(SignUpFailure(errMessage: e.message ?? 'An error occurred'));
      }
    }
  }
}
