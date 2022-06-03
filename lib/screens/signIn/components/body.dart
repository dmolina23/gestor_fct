import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        children: [
          TextField(decoration: textFieldInputDecoration("email")),
          TextField(decoration: textFieldInputDecoration("password")),
          const SizedBox(height: 8),
          Container(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPadding, vertical: kDefaultPadding / 2.5),
              child: const Text(
                'Forgot Password?',
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container()
        ],
      ),
    );
  }
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: hintText,
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: kContentColorLigthTheme),
      ),
      enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kContentColorLigthTheme)));
}
