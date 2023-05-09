import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_tutorial/business/auth/auth_cubit.dart';
import 'package:maps_tutorial/core/constants/texts.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
AuthCubit authCubit = AuthCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => authCubit,
          child: ElevatedButton(
            child: const Text(
              "Logout",
              style: TextStyle(fontSize: 45),
            ),
            onPressed: () {
              authCubit.logOut();
              Navigator.pushReplacementNamed(context, AppTexts.loginScreenRoute);
            },
          ),
        ),
      ),
    );
  }
}
