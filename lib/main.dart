import 'package:flavodish/constants.dart';
import 'package:flavodish/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FlavoDish());
}

class FlavoDish extends StatelessWidget {
  const FlavoDish({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: kScaffoldColor,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    );
  }
}
