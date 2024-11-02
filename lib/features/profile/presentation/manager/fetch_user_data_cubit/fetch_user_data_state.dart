import 'package:equatable/equatable.dart';
import 'package:flavodish/features/authentication/data/model/user_model.dart';

// Define the states for the FetchUserDataCubit
abstract class FetchUserDataState extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchUserDataInitial extends FetchUserDataState {}

class FetchUserDataLoading extends FetchUserDataState {}

class FetchUserDataSuccess extends FetchUserDataState {
  final UserModel user;

  FetchUserDataSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class FetchUserDataFailure extends FetchUserDataState {
  final String message;

  FetchUserDataFailure(this.message);
}
