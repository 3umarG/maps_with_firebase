import 'package:flutter/material.dart';

class PhoneCustomRow extends StatelessWidget {
  const PhoneCustomRow({Key? key, required this.formKey}) : super(key: key);

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
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
            decoration:  InputDecoration(
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
            decoration:  InputDecoration(
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
