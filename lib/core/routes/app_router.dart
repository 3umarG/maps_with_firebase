import 'package:flutter/material.dart';
import 'package:maps_tutorial/core/constants/texts.dart';
import 'package:maps_tutorial/presentation/screens/login/login_screen.dart';

class AppRouter {
  Route? generateRoutes(RouteSettings routeSettings){
    switch(routeSettings.name) {
      case AppTexts.loginScreenRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      default:
        return null;
    }

  }
}