import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_tutorial/business/auth/auth_cubit.dart';
import 'package:maps_tutorial/core/constants/texts.dart';
import 'package:maps_tutorial/presentation/screens/home_map/home_screen.dart';
import 'package:maps_tutorial/presentation/screens/login/login_screen.dart';
import 'package:maps_tutorial/presentation/screens/otp/otp_screen.dart';

class AppRouter {
  late AuthCubit authCubit;

  AppRouter() {
    authCubit = AuthCubit();
  }

  Route? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppTexts.loginScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: LoginScreen(),
          ),
        );
      case AppTexts.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>  HomeScreen()
        );
      case AppTexts.otpScreenRoute:
        final phone = routeSettings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: OtpScreen(
              phone: phone,
            ),
          ),
        );

      default:
        return null;
    }
  }
}
