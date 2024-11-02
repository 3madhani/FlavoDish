import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/authentication/data/model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({
    super.key,
    required this.user,
    required this.isEdit,
    required this.nameCo,
    required this.emailCo,
  });

  final UserModel user;
  final bool isEdit;
  final TextEditingController nameCo;
  final TextEditingController emailCo;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Email:',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: Styles.textStyle16.copyWith(
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                    controller: emailCo,
                    enabled: false, // Make email non-editable
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Name:',
                  style: Styles.textStyle16.copyWith(
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    style: Styles.textStyle16.copyWith(
                      color: isEdit ? Colors.black54 : Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                    controller: nameCo,
                    enabled: isEdit, // Allow name editing based on isEdit
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
