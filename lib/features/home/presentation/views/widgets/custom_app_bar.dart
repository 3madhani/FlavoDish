import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/profile/presentation/manager/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'package:flavodish/features/profile/presentation/manager/fetch_user_data_cubit/fetch_user_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kPadding,
        right: kPadding,
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: Styles.textStyle20.copyWith(
                    fontSize: 26,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Welcome Back,",
                      style: Styles.textStyle14.copyWith(
                        fontWeight: FontWeight.w900,
                        color: const Color.fromARGB(255, 123, 127, 133),
                      ),
                    ),
                    BlocConsumer<FetchUserDataCubit, FetchUserDataState>(
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
                      builder:
                          (BuildContext context, FetchUserDataState state) {
                        if (state is FetchUserDataLoading) {
                          return const Center(
                            child: SpinKitChasingDots(
                              color: Colors.blueAccent,
                              size: 50.0,
                            ),
                          );
                        } else if (state is FetchUserDataSuccess) {
                          return Text(
                            state.user.name,
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w900,
                              color: kPrimaryTextColor,
                            ),
                          );
                        } else {
                          return const Center(
                              child: Text('No user data found.'));
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            const CircleAvatar(
              backgroundColor: kPrimaryTextColor,
              radius: 24,
              child: Icon(
                HugeIcons.strokeRoundedUser,
              ),
            )
          ]),
    );
  }
}
