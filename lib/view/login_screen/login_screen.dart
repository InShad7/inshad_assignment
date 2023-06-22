import 'package:flutter/material.dart';
import 'package:viva/controller/controller.dart';
import 'package:viva/view/login_screen/widget/login_btn.dart';
import 'package:viva/view/login_screen/widget/main_card.dart';
import 'package:viva/view/login_screen/widget/signup_btn.dart';
import 'package:viva/view/login_screen/widget/text_field.dart';
import 'package:viva/view/signup_screen/signup_screen.dart';
import 'package:viva/view/utils/utils.dart';

final formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(physics: const BouncingScrollPhysics(), children: [
          const SignInText(title: 'Sign In'),
          kHeight20,
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
          const LoginBtn(),
          kHeight30,
          SignUpTxtBtn(navigateTo: SignUpScreen()),
          kHeight60,
        ]),
      ),
    );
  }
}
