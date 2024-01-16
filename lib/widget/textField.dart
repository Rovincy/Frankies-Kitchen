import 'package:flutter/material.dart';
import 'package:frankies_kitchen/widget/responsive.dart';

class InputTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const InputTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
// MediaQuery.of(context).size.width < 1200 &&
//       MediaQuery.of(context).size.width >= 768;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.8),
      child: Container(
        width: Responsive.isMobile(context)?300:400,
        // height: 200,
        child: TextField(
      
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              fillColor: Colors.white,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey)),
          // focusNode:OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.green.shade100)),
        ),
      ),
    );
  }
}
