import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/authentication/data/model/user_model.dart';
import 'package:flavodish/features/profile/presentation/manager/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:flavodish/features/profile/presentation/manager/fetch_user_data_cubit/fetch_user_data_state.dart';
import 'package:flavodish/features/profile/presentation/views/widgets/action_button.dart';
import 'package:flavodish/features/profile/presentation/views/widgets/profile_detail.dart';
import 'package:flavodish/features/profile/presentation/views/widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool isEdit = false; // Manage edit state here
  TextEditingController? nameCo;
  TextEditingController? emailCo;

  @override
  void dispose() {
    nameCo?.dispose();
    emailCo?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchUserDataCubit, FetchUserDataState>(
      listener: (context, state) {
        if (state is FetchUserDataFailure) {
          AwesomeDialog(
            padding: const EdgeInsets.all(10),
            context: context,
            body: Text(
              state.message,
              style: Styles.textStyle18,
              textAlign: TextAlign.center,
            ),
            dialogType: DialogType.error,
          ).show();
        }
      },
      builder: (BuildContext context, FetchUserDataState state) {
        if (state is FetchUserDataLoading) {
          return const Center(
            child: SpinKitChasingDots(
              color: Colors.blueAccent,
              size: 50.0,
            ),
          );
        } else if (state is FetchUserDataSuccess) {
          final user = state.user;
          nameCo = TextEditingController(text: user.name);
          emailCo = TextEditingController(text: user.email);
          return _buildProfileContent(
            context,
            user,
          );
        } else {
          return const Center(child: Text('No user data found.'));
        }
      },
    );
  }

  Widget _buildProfileContent(
    BuildContext context,
    UserModel user,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfileHeader(user: user),
          const SizedBox(height: 20),
          ProfileDetail(
            user: user,
            isEdit: isEdit,
            nameCo: nameCo!,
            emailCo: emailCo!,
          ),
          const SizedBox(height: 20),
          ActionButton(
            isEdit: isEdit,
            nameCo: nameCo!,
            onEditToggle: () {
              setState(() {
                isEdit = !isEdit; // Toggle the edit state
              });
            },
          ),
        ],
      ),
    );
  }
}
