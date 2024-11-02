import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flavodish/features/authentication/data/model/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fetch_user_data_state.dart';

class FetchUserDataCubit extends Cubit<FetchUserDataState> {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  UserModel? currentUser;

  FetchUserDataCubit(this.firestore, this.auth) : super(FetchUserDataInitial());

  void getUserData(String userId) {
    emit(FetchUserDataLoading());

    try {
      firestore.collection('users').doc(userId).snapshots().listen((doc) {
        if (doc.exists) {
          UserModel user = UserModel(
            email: doc['email'],
            name: doc['name'],
          );

          if (currentUser == null ||
              user.email != currentUser!.email ||
              user.name != currentUser!.name) {
            currentUser = user;
            emit(FetchUserDataSuccess(user));
          }
        } else {
          emit(FetchUserDataFailure('User not found'));
        }
      }, onError: (e) {
        emit(FetchUserDataFailure(e.toString()));
      });
    } catch (e) {
      emit(FetchUserDataFailure(e.toString()));
    }
  }

  Future<void> updateUserData(
    String newName,
  ) async {
    emit(FetchUserDataLoading());

    try {
      User? user = auth.currentUser;
      final userId = user?.uid;

      if (userId == null) {
        emit(FetchUserDataFailure("User ID is not available."));
        return;
      }

      // Re-authenticate user before updating email

      // Update user data in Firestore
      await firestore.collection('users').doc(userId).update({
        'name': newName,
      });

      // Re-fetch user data
      getUserData(userId);

      emit(
        FetchUserDataSuccess(
          UserModel(
            name: newName,
            email: user!.email!,
          ),
        ),
      );
    } catch (e) {
      emit(FetchUserDataFailure(e.toString()));
    }
  }
}
