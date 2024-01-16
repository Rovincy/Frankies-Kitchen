import 'package:flutter/material.dart';
import 'package:frankies_kitchen/api/getCompanyInfo.dart';
import 'package:frankies_kitchen/api/getEmployees.dart';
import 'package:frankies_kitchen/api/getLocation.dart';
import 'package:frankies_kitchen/view/kitchenScreen.dart';
import 'package:frankies_kitchen/view/loginPage.dart';
import 'package:frankies_kitchen/widget/logo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

List categories = [];
List items = [];
int? userId;
// String? printerName;

class _SplashScreenState extends State<SplashScreen> {
  String? loggedInUserName;

  @override
  void initState() {
    _fetchUser();

    super.initState();
  }

  _fetchUser() async {
    try {
      // print('This object');
      //   //print(username);
      //   // pageNotRefreshed = true;
       getLocations(context);
       getEmployees(context);
      await getCompanyInfo(context);
      // Navigator.pop(context);
      // Get.to(() => LoginPage());
      // Get.to(() => HomePage());
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      // setState(() {
        loggedInUserName = sharedPreferences.getString('username');
        // printerName = sharedPreferences.getString('printerName');
        userId = sharedPreferences.getInt('userId');
      // });
      // loggedInUserName == null
      // print(loggedInUserName);
      // print(userId);
      if(loggedInUserName!=null&&userId!=null){
          Get.offAllNamed('/HomePage');
      }else{
          Get.offAllNamed('/Login');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
          ],
        ),
      ),
    );
  }
}
