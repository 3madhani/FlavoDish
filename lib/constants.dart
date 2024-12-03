import 'package:flutter/material.dart';

const kScaffoldColor = Color(0xfff9f8fd);
const kTransitionDuration = Duration(seconds: 1, microseconds: 500);
const kSofiaPro = "Sofia Pro";
const kPrimaryTextColor = Color(0xff1985ff);
const kSecondaryTextColor = Color(0xffb1b8c2);
const double kPadding = 20;
const Map mealCategoriesMap = {
  "Breakfast": [
    "assets/images/Breakfast.jpg",
  ],
  "Lunch": [
    "assets/images/lunch.png",
  ],
  "Snack": [
    "assets/images/snack.jpg",
  ],
  "Dinner": [
    "assets/images/dinner.jpg",
  ],
  "TeaTime": [
    "assets/images/teatime.jpg",
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

const Color logInBg = Color(0xFF00C470);
const Color signUpBg = Color(0xFF000A54);

const double defaultPadding = 16.0;
const Duration defaultDuration = Duration(milliseconds: 300);

List<String> dishTypeList = [
  "Biscuits and cookies",
  "Bread",
  "Cereals",
  "Condiments and sauces",
  "Desserts",
  "Drinks",
  "Main course",
  "Pancake",
  "Preps",
  "Preserve",
  "Salad",
  'Sandwiches',
  "Side dish",
  "Soup",
  "Starter",
];

List<String> cuisineTypeList = [
  "American",
  "Asian",
  "British",
  "Caribbean",
  "Central Europe",
  "Chinese",
  "French",
  "Greek",
  "Indian",
  "Italian",
  "Japanese",
  "Korean",
  "Kosher",
  "Mexican",
  "Mediterranean",
  "Middle Eastern",
  "Nordic",
  "South American",
  "South East Asian",
  "World",
];
