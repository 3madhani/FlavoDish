part of 'sign_up_cubit.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String errMessage;

  const SignUpFailure({required this.errMessage});
}

final class SignUpSuccess extends SignUpState {}

final class SignUpEmailVerificationSent extends SignUpState {}

final class EmailVerifiedSuccess extends SignUpState {}

final class EmailNotVerified extends SignUpState {}
