import 'dart:async';

import 'package:check_dc/app/onboarding/widgets/onboarding_text.dart';
import 'package:check_dc/app/onboarding/widgets/signup_progress_indicator.dart';
import 'package:check_dc/contd.dart';
import 'package:check_dc/palette/palette.dart';
import 'package:check_dc/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingView1 extends StatefulWidget {
  const OnboardingView1({super.key});

  @override
  State<OnboardingView1> createState() => _OnboardingView1State();
}

class _OnboardingView1State extends State<OnboardingView1> {
  ValueNotifier<bool> canAnimate = false.notifier;
  ValueNotifier<int> target = 0.notifier;
  ValueNotifier<int> duration = 2000.notifier;

  void animate() {
    Timer(const Duration(milliseconds: 100), () {
      canAnimate.value = true;
    });
  }

  @override
  void dispose() {
    canAnimate.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Stack(
          children: [
            //! indicator
            [target, duration].multiSync(
              builder: (context, child) {
                return const OnboardingProgressIndicator(
                  target: 0,
                  duration: 5000,
                );
              },
            ),

            //! texts
            const OnboardingText(),

            //! skip, get started
            Positioned(
              bottom: 27.h,
              child: SizedBox(
                width: width(context),
                child: Padding(
                  padding: 30.padH,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 42.w,
                        height: 34.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Skip',
                              style: TextStyle(
                                color: darkGreen,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Container(
                              height: 5.h,
                              width: 42.w,
                              color: darkGreen,
                            )
                          ],
                        ),
                      ),
                      const AnimatedButton(
                        content: Text(''),
                        isLoading: true,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}