import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/app_router.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/authentication/manager/login_cubit/login_cubit.dart';
import 'package:flavodish/features/authentication/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:flavodish/features/authentication/presentation/views/widgets/login_animation_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'login_form.dart';
import 'sign_up_animated_text_button.dart';
import 'sign_up_form.dart';
import 'social_buttons.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody>
    with SingleTickerProviderStateMixin {
  bool isSignUp = false;
  bool isLoading = false;

  late AnimationController _animationController;
  late Animation<double> _animationTextRotate;

  String? email, password, confirmPassword, name;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  void setUpAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: defaultDuration,
    );

    _animationTextRotate =
        Tween<double>(begin: 0, end: 90).animate(_animationController);
  }

  @override
  void initState() {
    setUpAnimation();
    super.initState();
  }

  void updateView() {
    setState(() {
      loginFormKey.currentState!.reset();
      signUpFormKey.currentState!.reset();
      isSignUp = !isSignUp;
    });
    isSignUp ? _animationController.forward() : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: defaultDuration,
                width: size.width * 0.88,
                height: size.height,
                left: isSignUp ? -size.width * 0.76 : 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: logInBg,
                  ),
                  child: LoginForm(
                    formKey: loginFormKey,
                    onEmailChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    onPasswordChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                width: size.width * 0.88,
                height: size.height,
                left: isSignUp ? size.width * 0.12 : size.width * .88,
                child: Container(
                  decoration: const BoxDecoration(
                    color: signUpBg,
                  ),
                  child: SignUpForm(
                    formKey: signUpFormKey,
                    onNameChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    onEmailChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    onPasswordChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    onConfirmPasswordChanged: (value) {
                      setState(() {
                        confirmPassword = value;
                      });
                    },
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                top: size.height * 0.1,
                right: isSignUp ? -size.width * 0.06 : size.width * 0.06,
                left: 0,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white38,
                  child: AnimatedSwitcher(
                    duration: defaultDuration,
                    child: SvgPicture.asset(
                      isSignUp
                          ? "assets/svg/letter-s-svgrepo-com.svg"
                          : "assets/svg/animation_logo.svg",
                      color: isSignUp ? signUpBg : logInBg,
                      height: 30,
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: defaultDuration,
                bottom: size.height * 0.1,
                right: isSignUp ? -size.width * 0.06 : size.width * 0.06,
                left: 0,
                child: const SocialButtons(),
              ),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                  if (state is LoginSuccess) {
                    GoRouter.of(context).go(AppRouter.mainRoute);
                    setState(() {
                      isLoading = false;
                    });
                  } else if (state is LoginFailure) {
                    AwesomeDialog(
                      padding: const EdgeInsets.all(10),
                      context: context,
                      body: Text(
                        state.errMessage,
                        style: Styles.textStyle18,
                        textAlign: TextAlign.center,
                      ),
                      dialogType: DialogType.error,
                    ).show();

                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: LoginAnimatedTextButton(
                  isSignUp: isSignUp,
                  animationTextRotate: _animationTextRotate,
                  onTap: () {
                    if (isSignUp) {
                      updateView();
                    } else {
                      if (loginFormKey.currentState!.validate()) {
                        BlocProvider.of<LoginCubit>(context).loginUser(
                          email: email!, // Ensure email is not null
                          password: password!, // Ensure password is not null
                        );
                      }
                    }
                  },
                  // formKey: loginFormKey,
                ),
              ),
              BlocListener<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpLoading) {
                    setState(() {
                      isLoading = true;
                    });
                  }
                  if (state is SignUpEmailVerificationSent) {
                    // Show a dialog informing the user that a verification email has been sent
                    AwesomeDialog(
                      context: context,
                      body: const Text(
                        "A verification email has been sent to your email address. Please check your inbox.",
                        style: Styles.textStyle18,
                        textAlign: TextAlign.center,
                      ),
                      dialogType: DialogType.info,
                    ).show();
                    setState(() {
                      isLoading = false;
                    });
                    // Optionally navigate to a verification page if you have one
                    // Navigator.pushNamed(context, '/verification');
                  } else if (state is SignUpSuccess) {
                    GoRouter.of(context).go(AppRouter.mainRoute);
                    setState(() {
                      isLoading = false;
                    });
                  } else if (state is SignUpFailure) {
                    AwesomeDialog(
                      padding: const EdgeInsets.all(10),
                      context: context,
                      body: Text(
                        state.errMessage,
                        style: Styles.textStyle18,
                        textAlign: TextAlign.center,
                      ),
                      dialogType: DialogType.error,
                    ).show();
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: SignUpAnimatedTextButton(
                  isSignUp: isSignUp,
                  animationTextRotate: _animationTextRotate,
                  onTap: () {
                    if (!isSignUp) {
                      updateView();
                    } else {
                      // Check if password and confirm password match
                      if (signUpFormKey.currentState!.validate() &&
                          password == confirmPassword) {
                        BlocProvider.of<SignUpCubit>(context).registerUser(
                          email: email!,
                          password: password!,
                          name: name!,
                        );
                      } else if (password != confirmPassword) {
                        AwesomeDialog(
                          padding: const EdgeInsets.all(10),
                          context: context,
                          body: const Text(
                            "Passwords do not match!",
                            style: Styles.textStyle18,
                            textAlign: TextAlign.center,
                          ),
                          dialogType: DialogType.error,
                        ).show();
                      }
                    }
                  },
                ),
              ),
              if (isLoading)
                const Center(
                  child: SpinKitDoubleBounce(
                    color: kPrimaryTextColor,
                    size: 60.0,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
