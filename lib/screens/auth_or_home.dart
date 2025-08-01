import 'package:dengue_zero/models/auth.dart';
import 'package:dengue_zero/screens/auth_screen.dart';
import 'package:dengue_zero/screens/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? const OverviewScreen() : const AuthScreen();
  }
}
