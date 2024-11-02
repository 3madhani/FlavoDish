import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.isPassword,
    required this.isEmail,
    required this.onChange,
  });

  final IconData icon;
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final Function(String) onChange;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isHidden; // Manage visibility state here

  @override
  void initState() {
    super.initState();
    isHidden = widget.isPassword; // Initialize based on isPassword property
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        style: Styles.textStyle16.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
        cursorColor: Colors.white,
        onChanged: widget.onChange,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'required field';
          } else if (!widget.isPassword && widget.isEmail && !checkEmail(value)) {
            return "Check your email";
          }
          return null;
        },
        obscureText: isHidden,
        keyboardType:
            widget.isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(() {
                    isHidden = !isHidden;
                  }),
                )
              : null,
          prefixIcon: Icon(
            widget.icon,
            color: Colors.white,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: widget.hintText,
          errorStyle: const TextStyle(
            color: Colors.red,
          ),
          fillColor: Colors.white38,
          filled: true,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: defaultPadding * 1.2,
            horizontal: defaultPadding,
          ),
          hintStyle: Styles.textStyle14.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }


  bool checkEmail(String email) {
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(emailPattern);

    return regExp.hasMatch(email);
  }
}
