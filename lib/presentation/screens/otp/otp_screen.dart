import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key, required this.phone}) : super(key: key);
  final String phone;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeaderText(phone),
              const SizedBox(height: 55,),
              _buildCustomOtpPinCode(context),
            ],
          ),
        ),
      ),
    );
  }

  _buildHeaderText(String phone) {
    return RichText(
      text: TextSpan(
        text: "Please Enter the OTP code that sent to \n",
        style: const TextStyle(
            height: 1.5,
            color: Colors.black54,
            fontSize: 22,
            fontWeight: FontWeight.w600),
        children: [
          TextSpan(
            text: phone,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }

  _buildCustomOtpPinCode(BuildContext context) {
    return PinCodeTextField(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
     autoFocus: true,
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.deepPurple.shade300,
        activeColor: Colors.deepPurple,
        selectedColor: Colors.deepPurple,
        selectedFillColor: Colors.deepPurple.shade100,
        inactiveColor: Colors.deepPurple,
        inactiveFillColor: Colors.white
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}
