// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:check_dc/contd.dart';
import 'package:check_dc/palette/palette.dart';

class OnboardingProgressIndicator extends StatefulWidget {
  final int target;
  final int? duration;
  const OnboardingProgressIndicator({
    Key? key,
    required this.target,
    this.duration,
  }) : super(key: key);

  @override
  State<OnboardingProgressIndicator> createState() =>
      _OnboardingProgressIndicatorState();
}

class _OnboardingProgressIndicatorState
    extends State<OnboardingProgressIndicator> {
  ValueNotifier<bool> canAnimate = false.notifier;

  void animate() {
    Timer(const Duration(milliseconds: 100), () {
      canAnimate.value = true;
    });
  }

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    canAnimate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      width: double.infinity,
      child: canAnimate.sync(
        builder: (context, value, child) => Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: 30.padH,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                (index) {
                  if (index == widget.target) {
                    return Stack(
                      children: [
                        Container(
                          width: 61.5.w,
                          height: 7.h,
                          color: lightGreen,
                        ),
                        AnimatedContainer(
                          duration:
                              Duration(milliseconds: widget.duration ?? 500),
                          width: canAnimate.value ? 61.5.w : 0,
                          height: 7.h,
                          color: green,
                        ),
                      ],
                    );
                  } else if (index < widget.target) {
                    return Container(
                      width: 61.5.w,
                      height: 7.h,
                      color: green,
                    );
                  } else {
                    return Container(
                      width: 61.5.w,
                      height: 7.h,
                      color: lightGreen,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
