import 'package:flutter/material.dart';

const kScaffoldColor = Color(0xfff9f8fd);
const kTransitionDuration = Duration(seconds: 1, microseconds: 500);
const kSofiaPro = "Sofia Pro";
const kPrimaryTextColor = Color(0xff1985ff);
const kSecondaryTextColor = Color(0xffb1b8c2);
const double kPadding = 20;
const Map mealCatagoriesMap = {
  "Breakfast": [
    "assets/images/Breakfast.jpg",
  ],
  "Lunch": [
    "assets/images/lunch.png",
  ],
  "Dinner": [
    "assets/images/dinner.jpg",
  ],
};
const String caloriesSvg = "assets/svg/apple-svgrepo-com.svg";
const String fatSvg = "assets/svg/reshot-icon-hot-dog-CD9MJXN5FG.svg";
const String carboSvg = "assets/svg/reshot-icon-love-ice-cream-T8QVEY7WKB.svg";
const String protSvg = "assets/svg/reshot-icon-muscle-SLMN5ZY8JG.svg";

const Map progressCardMap = {
  "Calories": [
    caloriesSvg,
    "Kcal",
    .95,
    Color(0xff5fe69a),
    Color(0xffc7ee7e),
  ],
  "Fats": [
    fatSvg,
    "Fats",
    .25,
    Color(0xfffd478a),
    Color(0xffff8ba6),
  ],
  "Carbs": [
    carboSvg,
    "Carbs",
    .70,
    Color.fromARGB(255, 253, 171, 64),
    Color.fromARGB(255, 247, 197, 91),
  ],
  "Proteins": [
    protSvg,
    "Prot",
    .65,
    Color(0xff2ba6f3),
    Color(0xff56eaf2),
  ],
};


// const Color(0xff5fe69a),
//                 const Color(0xffc7ee7e).withOpacity(.6),
//                 const Color(0xff5fe69a),