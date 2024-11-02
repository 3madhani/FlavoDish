import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the user has verified their email
      if (userCredential.user != null && !userCredential.user!.emailVerified) {
        emit(const LoginFailure(errMessage: "Please verify your email address."));
        // Optionally, sign out the user if they are signed in but their email is not verified
        await FirebaseAuth.instance.signOut();
        return;
      }

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential' || e.code == 'wrong-password') {
        emit(const LoginFailure(errMessage: "Email or password is incorrect"));
      } else if (e.code == 'user-not-found') {
        emit(LoginFailure(errMessage: e.message ?? 'An error occurred'));
      } else {
        emit(LoginFailure(errMessage: e.message ?? 'An error occurred'));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: e.toString()));
    }
  }
}
