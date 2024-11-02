import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/app_router.dart';
import 'package:flavodish/features/authentication/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:flavodish/features/authentication/manager/login_cubit/login_cubit.dart';
import 'package:flavodish/features/authentication/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/service_locator.dart';
import 'features/profile/presentation/manager/fetch_user_data_cubit/fetch_user_data_cubit.dart';
import 'firebase_options.dart';

bool? isLogin;

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }

  // Initialize Hive
  await Hive.initFlutter();

  // Open the favorites box
  await Hive.openBox<String>('favorites');
  setupServiceLocator();

  runApp(const FlavoDish());
}

class FlavoDish extends StatelessWidget {
  const FlavoDish({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => FetchUserDataCubit(
              FirebaseFirestore.instance, FirebaseAuth.instance)
            ..getUserData(FirebaseAuth.instance.currentUser!.uid),
        ),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(
            FirebaseAuth.instance,
          ),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter(isLogin: isLogin!).router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: kScaffoldColor,
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
      ),
    );
  }
}
