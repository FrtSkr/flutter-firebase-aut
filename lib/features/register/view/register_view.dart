import 'package:firebase_aut/core/colors/colors.dart';
import 'package:firebase_aut/core/components/components_style.dart';
import 'package:firebase_aut/core/components/custom_elevated_button.dart';
import 'package:firebase_aut/core/components/custom_text_field.dart';
import 'package:firebase_aut/core/constants/constant_edge_insets.dart';
import 'package:firebase_aut/core/constants/constant_string.dart';
import 'package:firebase_aut/features/register/service/register_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../users/model/user_model.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({Key? key}) : super(key: key);

  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView>
    with RegisterService {
  final TextEditingController controllerFirstName = TextEditingController();
  final TextEditingController controllerLastName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final firebaseAut = FirebaseAuth.instance;
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
        children: [
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop35,
            child: CustomTextField(
                titleController: controllerFirstName,
                icon: const Icon(Icons.person_pin_circle_rounded),
                labelText: ConstantString.FIRST_NAME,
                isObscure: false,
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                titleController: controllerLastName,
                icon: const Icon(Icons.person_pin_circle_rounded),
                labelText: ConstantString.LAST_NAME,
                isObscure: false,
                keyboardType: TextInputType.text),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                titleController: controllerEmail,
                icon: const Icon(Icons.email_outlined),
                labelText: ConstantString.EMAIL,
                isObscure: false,
                keyboardType: TextInputType.emailAddress),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                titleController: controllerPhone,
                icon: const Icon(Icons.phone_outlined),
                labelText: ConstantString.PHONE_NUMBER,
                isObscure: false,
                keyboardType: TextInputType.phone),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: CustomTextField(
                titleController: controllerPassword,
                icon: const Icon(Icons.remove_red_eye_outlined),
                labelText: ConstantString.PASSWORD,
                isObscure: true,
                keyboardType: TextInputType.visiblePassword),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop35,
            child: CustomElevatedButton(
              elevatedButton: ElevatedButton(
                onPressed: () {
                  final user = UserModel(
                      id: DateTime.now().microsecond.toString() +
                          DateTime.now().millisecond.toString(),
                      name:
                          '${controllerFirstName.text} ${controllerLastName.text}',
                      email: controllerEmail.text,
                      phone: controllerPhone.text,
                      password: controllerPassword.text);

                  RegisterService().createUser(user);

                  firebaseAut.createUserWithEmailAndPassword(
                      email: controllerEmail.text.trim(),
                      password: controllerPassword.text.trim());

                  controllerFirstName.clear();
                  controllerLastName.clear();
                  controllerEmail.clear();
                  controllerPhone.clear();
                  controllerPassword.clear();

                  Navigator.pop(context);
                },
                style: ComponentStyle.elevatedButtonStyle(),
                child: Text(
                  ConstantString.CREATE_ACCOUNT,
                  style: ComponentStyle.elevatedButtonTextStyle(context),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
