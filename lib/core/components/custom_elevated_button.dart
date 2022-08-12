import 'package:firebase_aut/core/colors/colors.dart';
import 'package:firebase_aut/core/constants/constant_edge_insets.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({Key? key, required this.title}) : super(key: key);

  final String title;
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
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: ConstantEdgeInsets.paddingOnlyRL50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                color: ProjectColors.colorWhite,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
