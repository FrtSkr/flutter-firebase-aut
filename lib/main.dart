import 'package:firebase_aut/core/colors/colors.dart';
import 'package:firebase_aut/features/login/view/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
      )),
      home: const LoginScreen(),
    );
  }
}
