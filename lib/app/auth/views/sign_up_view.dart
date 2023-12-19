import 'package:check_dc/contd.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          height: height(context),
          width: width(context),
        ));
  }
}
