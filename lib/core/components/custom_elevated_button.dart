import 'package:firebase_aut/core/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({Key? key, required this.elevatedButton})
      : super(key: key);

  final ElevatedButton elevatedButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ProjectColors.firebaseSecondOrange,
              ProjectColors.firebaseThirdOrange,
            ],
          )),
      child: elevatedButton,
    );
  }
}
