import 'package:firebase_aut/core/colors/colors.dart';
import 'package:firebase_aut/core/components/custom_elevated_button.dart';
import 'package:firebase_aut/core/components/custom_text_field.dart';
import 'package:firebase_aut/core/constants/constant_edge_insets.dart';
import 'package:firebase_aut/core/constants/constant_string.dart';
import 'package:flutter/material.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({Key? key}) : super(key: key);

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: ProjectColors.firebaseFirstOrange),
        centerTitle: true,
        title: Text(
          ConstantString.CREATE_ACCOUNT,
          style: Theme.of(context).textTheme.headline4?.copyWith(
                color: ProjectColors.firebaseFirstOrange,
              ),
        ),
      ),
      body: Column(
        children: const [
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop35,
            child: CustomTextField(
                icon: Icon(Icons.person_pin_circle_rounded),
                labelText: ConstantString.FIRST_NAME,
                isObscure: false,
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                icon: Icon(Icons.person_pin_circle_rounded),
                labelText: ConstantString.LAST_NAME,
                isObscure: false,
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                icon: Icon(Icons.person_outline),
                labelText: ConstantString.USER_ID,
                isObscure: false,
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                icon: Icon(Icons.email_outlined),
                labelText: ConstantString.EMAIL,
                isObscure: false,
                keyboardType: TextInputType.emailAddress),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                icon: Icon(Icons.phone_outlined),
                labelText: ConstantString.PHONE_NUMBER,
                isObscure: false,
                keyboardType: TextInputType.phone),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                icon: Icon(Icons.remove_red_eye_outlined),
                labelText: ConstantString.PASSWORD,
                isObscure: true,
                keyboardType: TextInputType.visiblePassword),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop35,
            child: CustomElevatedButton(title: ConstantString.CREATE_ACC),
          )
        ],
      ),
    );
  }
}
