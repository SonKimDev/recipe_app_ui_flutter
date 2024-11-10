import 'package:flutter/material.dart';
import 'package:recipe_app_ui_flutter/src/screens/recipe_onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipeOnboardingScreen(),
    );
  }
}

