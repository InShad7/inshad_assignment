import 'package:flutter/material.dart';
import 'package:viva/controller/controller.dart';
import 'package:viva/view/login_screen/login_screen.dart';
import 'package:viva/view/login_screen/widget/login_btn.dart';
import 'package:viva/view/login_screen/widget/main_card.dart';
import 'package:viva/view/login_screen/widget/signup_btn.dart';
import 'package:viva/view/login_screen/widget/text_field.dart';
import 'package:viva/view/utils/utils.dart';

final SignUpformKey = GlobalKey<FormState>();

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: SignUpformKey,
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          const SignInText(title: 'Sign Up'),
          kHeight30,
          MyTextField(
              title: 'Name',
              icon: Icons.abc,
              myControler: nameController,
              passChar: false,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Name can\'t be empty';
                }
              }),
          kHeight,
          MyTextField(
              title: 'Email',
              icon: Icons.mail,
              myControler: userNameController,
              passChar: false,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Email can\'t be empty';
                }
              }),
          kHeight,
          MyTextField(
              title: 'Password',
              icon: Icons.lock,
              myControler: passwordController,
              passChar: true,
              validator: (val) {
                if (val.isEmpty) {
                  return 'Password can\'t be empty';
                }
              }),
          kHeight30,
          const LoginBtn(signup: true),
          kHeight20,
          const SignUpTxtBtn(
            signUp: false,
            navigateTo: LoginScreen(),
          )
        ]),
      ),
    );
  }
}
