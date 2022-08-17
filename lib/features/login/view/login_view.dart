import 'package:firebase_aut/core/colors/colors.dart';
import 'package:firebase_aut/core/components/components_style.dart';
import 'package:firebase_aut/core/components/custom_elevated_button.dart';
import 'package:firebase_aut/core/components/custom_text_field.dart';
import 'package:firebase_aut/core/constants/constant_edge_insets.dart';
import 'package:firebase_aut/core/constants/constant_string.dart';
import 'package:firebase_aut/features/home/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_text_button.dart';
import '../../../core/navigation/page_navigation.dart';
import '../../register/view/register_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String logoPath = getFullImgPath("firebase_black.webp");
  final controllerEmail = TextEditingController();
  final controllerPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyRLT10,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ProjectColors.firebaseFirstOrange,
                    ProjectColors.firebaseThirdOrange,
                    ProjectColors.firebaseSecondOrange,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Card(
                color: Colors.transparent,
                shadowColor: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: ConstantEdgeInsets.paddingOnlyTop10,
                      child: Image.asset(
                        logoPath,
                        color: ProjectColors.colorWhite,
                      ),
                    ),
                    Padding(
                      padding: ConstantEdgeInsets.paddingOnlyTop10,
                      child: Text(
                        ConstantString.PROJECT_NAME,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              color: ProjectColors.colorWhite,
                            ),
                      ),
                    ),
                    Padding(
                      padding: ConstantEdgeInsets.paddingOnlyTop35,
                      child: CustomTextField(
                          titleController: controllerEmail,
                          icon: const Icon(
                            Icons.person_outline,
                          ),
                          labelText: ConstantString.EMAIL,
                          isObscure: false,
                          keyboardType: TextInputType.text),
                    ),
                    Padding(
                      padding: ConstantEdgeInsets.paddingOnlyTop10,
                      child: CustomTextField(
                          titleController: controllerPass,
                          icon: const Icon(
                            Icons.password,
                          ),
                          labelText: ConstantString.PASSWORD,
                          isObscure: true,
                          keyboardType: TextInputType.visiblePassword),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomTextButton(
                          title: ConstantString.FORGOT_PASS_BUTTON,
                          color: ProjectColors.colorWhite,
                        ),
                        CustomTextButton(
                          title: ConstantString.HELP_BUTTON,
                          color: ProjectColors.colorWhite,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop35,
            child: CustomElevatedButton(
              elevatedButton: ElevatedButton(
                onPressed: () {
                  singIn(controllerEmail, controllerPass, context);
                },
                style: ComponentStyle.elevatedButtonStyle(),
                child: Text(
                  ConstantString.SIGN_IN_BUTTON_TITLE,
                  style: ComponentStyle.elevatedButtonTextStyle(context),
                ),
              ),
            ),
          ),
          Padding(
            padding: ConstantEdgeInsets.paddingOnlyTop10,
            child: Text(
              ConstantString.OR_TEXT,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: ProjectColors.colorGrey400,
                  ),
            ),
          ),
          CustomTextButton(
            title: ConstantString.REGISTER_BUTTON_TITLE,
            color: ProjectColors.colorGrey400,
            context: context,
            widget: const RegisterScreenView(),
          ),
        ],
      ),
    );
  }
}

String getFullImgPath(String imgName) {
  String baseImgPath = "assets/img/";
  return baseImgPath + imgName;
}

singIn(TextEditingController controllerEmail,
    TextEditingController controllerPass, BuildContext context) {
  try {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: controllerEmail.text.trim(),
            password: controllerPass.text.trim())
        .then((value) =>
            FirebaseAuth.instance.authStateChanges().listen((User? user) {
              if (user != null) {
                PageNavigation.navigateToWidgetArguments(
                    context, const HomeScreen());
                print("Giriş başarılı");
              } else {
                print("Kullanıcı yok!!!");
              }
            }));
  } on FirebaseAuthException catch (e) {
    print("Debug: $e");
  }
}
