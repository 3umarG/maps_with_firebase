import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maps_tutorial/core/constants/texts.dart';
import 'package:maps_tutorial/core/routes/app_router.dart';
late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseAuth.instance.authStateChanges().listen((user) {
    // You have logged out , no user
    // you should go to login page
    if(user == null){
      initialRoute = AppTexts.loginScreenRoute;
    }else {
      initialRoute = AppTexts.homeScreenRoute;
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: initialRoute,
      onGenerateRoute: AppRouter().generateRoutes,
    );
  }
}
