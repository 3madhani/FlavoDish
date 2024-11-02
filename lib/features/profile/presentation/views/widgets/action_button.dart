import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/profile/presentation/manager/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:flavodish/features/profile/presentation/views/widgets/log_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.isEdit,
    required this.nameCo,
    required this.onEditToggle,
  });

  final bool isEdit;
  final TextEditingController nameCo;
  final VoidCallback onEditToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            if (isEdit) {
              // Save changes
              context.read<FetchUserDataCubit>().updateUserData(
                    nameCo.text,
                  );
            }
            onEditToggle(); // Toggle edit state
          },
          child: Text(
            isEdit ? "Save Profile" : "Edit Profile",
            style: Styles.textStyle18.copyWith(
              color: isEdit
                  ? Colors.blueAccent
                  : const Color(
                      0xff464a55,
                    ),
            ),
          ),
        ),
        const LogOutButton(),
      ],
    );
  }
}
