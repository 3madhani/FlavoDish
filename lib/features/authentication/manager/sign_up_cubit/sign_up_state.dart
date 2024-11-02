part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpEmailVerificationSent extends SignUpState {}

class SignUpSuccess extends SignUpState {
} // Add this state

class SignUpFailure extends SignUpState {
  final String errMessage;

  const SignUpFailure({required this.errMessage});

  @override
  List<Object> get props => [errMessage]; // Include errMessage for better equality comparison
}
