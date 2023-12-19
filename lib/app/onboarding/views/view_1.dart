// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:check_dc/app/auth/views/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:check_dc/contd.dart';

class View1 extends StatefulWidget {
  final PageController backgroundViewController;
  final PageController textViewController;
  final String lottie;
  final ValueNotifier<int> pageIndex;
  const View1({
    Key? key,
    required this.backgroundViewController,
    required this.textViewController,
    required this.lottie,
    required this.pageIndex,
  }) : super(key: key);

  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> {
  Timer? timer;
  move() {
    timer = Timer(const Duration(milliseconds: 10000), () {
      if (widget.pageIndex.value == 4) {
        fadeTo(context, const SignUpView());
      } else {
        widget.backgroundViewController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
        widget.textViewController.nextPage(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void initState() {
    move();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(widget.lottie.lottie, fit: BoxFit.fill);
  }
}
