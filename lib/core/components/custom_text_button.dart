import 'package:firebase_aut/core/components/components_style.dart';
import 'package:firebase_aut/core/navigation/page_navigation.dart';
import 'package:firebase_aut/features/login/view/login_view.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key,
      required this.title,
      required this.color,
      this.context,
      this.widget})
      : super(key: key);
  final String title;
  final Color color;
  final BuildContext? context;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (this.context != null && widget != null) {
          PageNavigation.navigateToWidget(
              this.context ?? context, widget ?? const LoginScreen());
        }
      },
      child: Text(
        title,
        style: ComponentStyle.textButtonTextStyle(context, color),
      ),
    );
  }
}
