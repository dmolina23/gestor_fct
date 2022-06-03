// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sign in"),
          backgroundColor: kPrimaryColor,
        ),
        body: const Body());
  }
}
