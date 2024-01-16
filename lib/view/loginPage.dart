import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frankies_kitchen/widget/myloadingindicator.dart';
import 'package:frankies_kitchen/widget/responsive.dart';
import 'package:frankies_kitchen/widget/textField.dart';
import 'package:get/get.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../api/baseUrl.dart';

class LoginPage extends StatelessWidget {
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'WELCOME!',
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(
                height: 50,
              ),
              InputTextField(
                controller: userController,
                hintText: 'Enter your Name',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              InputTextField(
                controller: passwordController,
                hintText: 'Enter your password',
                obscureText: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // SubmitButton(onTap: () => signIn(context))
              InkWell(
                onTap: (){
                  myLoadingIndicator(context);
                  signIn(context);},
                child: Container(
        width: Responsive.isMobile(context) ? 300 : 400,
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text(
            'Sign-In',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
          ),
        ),
            ),
              )
            ],
          ),
        ),
      ),
    );
  }

  signIn(BuildContext context) async {
    if (userController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse('$baseUrl/api/kitchen/Authenticate'),
        headers: {
          'Accept': 'application/json',
          'Content-type': 'application/json'
        },
        body: jsonEncode({
          'username': userController.text,
          "password": passwordController.text
        }),
      );
      // print(jsonDecode(response.body));
      var data = jsonDecode(response.body);
      // print(data['data']['id']);

      if (data['succeeded']==true) {
        var username = userController.text;
        final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
        sharedPreferences.setString("username", username);
        sharedPreferences.setInt('userId', data['data']['id']);
        // Get.to(() => const KitchScreen());
        Get.offAllNamed('/Splashscreen');
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data['message'].toString())));
        // throw Exception('Failed to login');
      }
    } else {
        Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Empty field not allowed")));
    }
  }
}
