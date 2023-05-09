import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps_tutorial/business/auth/auth_cubit.dart';
import 'package:maps_tutorial/core/constants/texts.dart';
import 'package:maps_tutorial/presentation/widgets/loading_dialog.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  late String phone;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeaderForLoginScreen(),
              const SizedBox(
                height: 36,
              ),
              _buildPhoneRow(),
              const SizedBox(
                height: 55,
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoadingState) {
                    showLoadingDialog(context);
                  } else if (state is AuthErrorState) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.exception.message),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 5),
                    ));
                  } else if (state is AuthPhoneNumberSubmittedState) {
                    Navigator.pop(context);
                    Navigator.pushReplacementNamed(
                      context,
                      AppTexts.otpScreenRoute,
                      arguments: phone,
                    );
                  }
                },
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 3),
                        backgroundColor: Colors.deepPurple),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await context.read<AuthCubit>().submitPhone(phone);
                      }
                    },
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  _buildHeaderForLoginScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          "Login",
          style: TextStyle(
            fontSize: 35,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Please Provider your phone number for authentication :",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.grey),
        )
      ],
    );
  }

  _buildPhoneRow() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: TextFormField(
            enabled: false,
            textAlign: TextAlign.center,
            cursorColor: Colors.deepPurple,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: 2,
              fontSize: 18,
            ),
            initialValue: '${_generateCountryFlag("eg")} +20',
            autovalidateMode: AutovalidateMode.always,
            decoration: InputDecoration(
              border: _border(),
              enabledBorder: _border(),
              disabledBorder: _border(),
              focusedBorder: _border(),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            cursorColor: Colors.deepPurple,
            style: const TextStyle(
              letterSpacing: 2,
              fontSize: 18,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: _border(),
              enabledBorder: _border(),
              disabledBorder: _border(),
              focusedBorder: _border(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "You Should enter your phone number !!";
              } else if (value.length < 11) {
                return "Too short for phone number !!";
              } else {
                return null;
              }
            },
            onSaved: (va) {
              phone = va!;
            },
            keyboardType: TextInputType.phone,
          ),
        ),
      ],
    );
  }

  String _generateCountryFlag(String code) {
    String flag = code.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  _border() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.deepPurple,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
