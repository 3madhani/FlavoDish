import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utils/service_locator.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

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
    return MaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kScaffoldColor,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    );
  }
}
