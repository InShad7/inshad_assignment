import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:viva/controller/controller.dart';
import 'package:viva/main.dart';
import 'package:viva/view/login_screen/login_screen.dart';
import 'package:viva/view/signup_screen/signup_screen.dart';
import 'package:viva/view/splash_screen.dart/spalsh_screen.dart';
import 'package:viva/view/utils/utils.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key, this.signup = false});
  final signup;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 11,
                  offset: const Offset(5, 11),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: white,
            ),
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (signup
                    ? !SignUpformKey.currentState!.validate()
                    : !formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Please provide valid credentials',
                        style: TextStyle(fontSize: 17),
                      ),
                      backgroundColor: deleteRed,
                    ),
                  );
                } else {
                  signIn(context);
                }
              },
              child: Text(
                signup ? 'Sign Up' : 'Sign In',
                style: TextStyle(fontSize: 28, color: white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future signIn(context) async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child: LoadingIndicator(
              indicatorType: Indicator.circleStrokeSpin,
              colors: [white],
              strokeWidth: 2),
        ),
      ),
    );

    try {
      if (signup) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userNameController.text.trim(),
          password: passwordController.text.trim(),
        );

        final currentUser = FirebaseAuth.instance.currentUser;
        await currentUser!.updateDisplayName(nameController.text.trim());
      } else {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: userNameController.text.trim(),
            password: passwordController.text.trim());
      }
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            signup ? 'Sign in successfully' : 'Logged In  successfully',
            style: const TextStyle(fontSize: 18),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: green,
        ),
      );
      if (signup) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CheckUserLogin(),
          ),
        );
      }

      userNameController.clear();
      passwordController.clear();
      nameController.clear();
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Enter valid Credentials';
      if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid';
      } else if (e.code == 'email-already-in-use') {
        errorMessage = 'The email address is already in use';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            errorMessage,
            style: const TextStyle(fontSize: 18),
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: deleteRed,
        ),
      );
    }
    if (signup == false) {
      navigatorKey.currentState!.popUntil((route) {
        return route.isFirst;
      });
    }
  }
}
