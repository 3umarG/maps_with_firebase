import 'package:flutter/material.dart';
import 'package:maps_tutorial/presentation/widgets/login/phone_custom_row.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

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
              PhoneCustomRow(
                formKey: formKey,
              ),
              const SizedBox(
                height: 55,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 3),
                      backgroundColor: Colors.deepPurple),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 30,
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
}
