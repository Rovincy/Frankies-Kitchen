// import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
// import 'package:frankie_s/PDFtest/page/pdf_page.dart';
// import 'package:frankie_s/Widget/NewHome.dart';
// import 'package:frankie_s/Widget/newReceipt.dart';
// import 'package:frankie_s/ui/restaurant/OrderPage.dart';
// import 'package:frankie_s/ui/sharedUI/homepage.dart';
// import 'package:frankie_s/ui/sharedUI/signin.dart';
import 'package:frankies_kitchen/model/bucketVariable.dart';
import 'package:frankies_kitchen/providers/countProvider.dart';
import 'package:frankies_kitchen/providers/fiterLocationProvider.dart';
import 'package:frankies_kitchen/view/kitchenScreen.dart';
import 'package:frankies_kitchen/view/loginPage.dart';
import 'package:frankies_kitchen/view/splashscreen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // setPathUrlStrategy();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (_) => Model()),
                  ChangeNotifierProvider(create: (_) => BucketVariable()),
        ChangeNotifierProvider(create: (_) => Count()),
        ChangeNotifierProvider(create: (_) => FilterLocation()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // title: 'Flash Photo',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          // routeInformationParser: BeamerParser(),
          // routerDelegate: routerDelegate,
          home: const SplashScreen(),
          routes: <String, WidgetBuilder>{
          '/Login': (BuildContext context) => LoginPage(),
          '/HomePage': (BuildContext context) => const KitchScreen(),
          '/Splashscreen': (BuildContext context) => const SplashScreen(),
          },
        ),
      );
  }
}










// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:frankies_kitchen/model/bucketVariable.dart';
// import 'package:frankies_kitchen/providers/countProvider.dart';
// import 'package:frankies_kitchen/providers/fiterLocationProvider.dart';
// import 'package:frankies_kitchen/view/kitchenScreen.dart';
// import 'package:frankies_kitchen/view/loginPage.dart';
// import 'package:frankies_kitchen/view/splashscreen.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// void main() {
//   //WidgetsFlutterBinding.ensureInitialized();
//   // setPathUrlStrategy();
//   // Set the orientation to landscape left
//   SystemChrome.setPreferredOrientations([
//     DeviceOrientation.landscapeLeft,
//   ]);
//   runApp(MultiProvider(
//     providers: [ChangeNotifierProvider(create: (context) => FilterLocation())],
//     child: MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => BucketVariable()),
//         ChangeNotifierProvider(create: (_) => Count()),
//         ChangeNotifierProvider(create: (_) => FilterLocation()),
//       ],
//       child: GetMaterialApp(
//         debugShowCheckedModeBanner: false,
//         // title: 'Flash Photo',
//         theme: ThemeData(
//           primarySwatch: Colors.red,
//         ),
//         // routeInformationParser: BeamerParser(),
//         // routerDelegate: routerDelegate,
//         home: const SplashScreen(),
//         routes: <String, WidgetBuilder>{
//           '/Login': (BuildContext context) => LoginPage(),
//           '/HomePage': (BuildContext context) => const KitchScreen(),
//           '/Splashscreen': (BuildContext context) => const SplashScreen(),
//           // '/OrderPage': (BuildContext context) => OrderPage(),
//           /*'/WelcomePage':(BuildContext context)=> const WelcomePage(),
//           '/SplashScreen':(BuildContext context)=> const SplashScreen(),
//           '/Login':(BuildContext context)=> const Login(),
//           '/SignUp':(BuildContext context)=> const SignUp(),*/
//         },
//       ),
//     );
//   }
// }
