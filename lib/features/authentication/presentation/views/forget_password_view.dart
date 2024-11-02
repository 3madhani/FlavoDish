import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/authentication/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:flavodish/features/authentication/manager/forget_password_cubit/forget_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/forget_password_form.dart';
import 'widgets/forget_password_listener.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: logInBg,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: logInBg,
        elevation: 3,
        title: Text(
          'Reset Password',
          style: Styles.textStyle20.copyWith(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) =>
            ForgotPasswordListener.handleState(context, state),
        child: const ForgotPasswordForm(),
      ),
    );
  }
}
