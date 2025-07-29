import 'package:dengue_zero/screens/my_complaints.dart';
import 'package:dengue_zero/screens/new_complaint.dart';
import 'package:dengue_zero/screens/overview_screen.dart';
import 'package:dengue_zero/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(300, 60),
            backgroundColor: Colors.red.shade800,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
              vertical: 16,
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Colors.red.shade800,
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
          headlineMedium: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 20,
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const OverviewScreen(),
        AppRoutes.NEW_COMPLAINT: (ctx) => const NewComplaint(),
        AppRoutes.MY_COMPLAINTS: (ctx) => const MyComplaints(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
