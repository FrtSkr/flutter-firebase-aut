import 'package:firebase_aut/core/colors/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.firebaseSecondOrange,
      appBar: AppBar(
        title: Text(
          "Home Screen",
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: ProjectColors.colorGrey400,
              ),
        ),
        centerTitle: true,
      ),
    );
  }
}
