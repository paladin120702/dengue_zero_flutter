import 'package:dengue_zero/utils/app_routes.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SizedBox(
          height: kToolbarHeight,
          child: Image.asset(
            'assets/images/Z.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Olá, João!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 25),
            Text(
              'AJUDE A COMBATER A DENGUE',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.NEW_COMPLAINT);
              },
              child: const Text('NOVA DENÚNCIA'),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.MY_COMPLAINTS);
              },
              child: const Text('MINHAS DENÚNCIAS'),
            ),
          ],
        ),
      ),
    );
  }
}
