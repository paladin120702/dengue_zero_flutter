import 'package:dengue_zero/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: deviceSize.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: deviceSize.height * 0.30,
                width: double.infinity,
                child: Image.asset('assets/images/dengue_zero.png'),
              ),
              const AuthForm(),
            ],
          ),
        ),
      ),
    );
  }
}
