import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'forget_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final FirebaseAuth auth;

  ForgotPasswordCubit(this.auth) : super(ForgotPasswordInitial());

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgotPasswordLoading());

    try {
      await auth.sendPasswordResetEmail(email: email.trim());
      emit(ForgotPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgotPasswordFailure(e.message ?? 'An error occurred'));
    }
  }
}
