import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viva/view/utils/utils.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.title,
    required this.icon,
    required this.myControler,
    required this.passChar,
    this.validator,
  });
  String title;
  var myControler;
  IconData? icon;
  bool passChar;
  final validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12),
            width: double.infinity,
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
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(
                        r"[a-zA-Z0-9@._-]"), 
                  ),
                ],
                validator: validator,
                obscureText: passChar,
                controller: myControler,
                cursorColor: blue,
                style: TextStyle(color: black),
                decoration: InputDecoration(
                  prefixIcon: Icon(icon, size: 28, color: blue),
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: const EdgeInsets.all(5),
                  hintText: title,
                  hintStyle: const TextStyle(fontSize: 22),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
