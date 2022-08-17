import 'package:firebase_aut/core/colors/colors.dart';
import 'package:firebase_aut/core/constants/constant_edge_insets.dart';
import 'package:flutter/material.dart';

class ComponentStyle {
  static TextStyle? elevatedButtonTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle2?.copyWith(
          color: ProjectColors.colorWhite,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle? textButtonTextStyle(BuildContext context, Color color) {
    return Theme.of(context).textTheme.subtitle2?.copyWith(
          color: color,
        );
  }

  static ButtonStyle elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      primary: Colors.transparent,
      shadowColor: Colors.transparent,
      padding: ConstantEdgeInsets.paddingOnlyRL50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }
}
