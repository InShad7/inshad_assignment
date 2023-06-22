import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:viva/view/utils/utils.dart';

TextEditingController nameController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

void alertBox({
  context,
}) {
  showModalBottomSheet(
    backgroundColor: cardClr2,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18),
      ),
    ),

    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        kHeight,
        SizedBox(
          width: 400,
          height: 60,
          child: TextButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Navigator.pop(context);
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.teal, fontSize: 18),
            ),
          ),
        ),
        // kHeight,
        const Divider(indent: 60, endIndent: 60),
        SizedBox(
          height: 50,
          width: 400,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: deleteRed, fontSize: 18),
            ),
          ),
        ),
        kHeight,
      ],
    ),
  );
}
