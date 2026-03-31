import 'package:flutter/material.dart';
import 'package:midterm_budget_app/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Wallet',
      theme: ThemeData.dark(),
      home: WelcomePage(),
    );
  }
}
