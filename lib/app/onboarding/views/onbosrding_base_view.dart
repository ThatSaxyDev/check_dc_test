import 'dart:async';

import 'package:check_dc/app/auth/views/sign_up_view.dart';
import 'package:check_dc/app/onboarding/views/view_1.dart';
import 'package:check_dc/app/onboarding/widgets/onboarding_text.dart';
import 'package:check_dc/app/onboarding/widgets/onboarding_progress_indicator.dart';
import 'package:check_dc/contd.dart';
import 'package:check_dc/palette/palette.dart';
import 'package:check_dc/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingBaseView extends StatefulWidget {
  const OnboardingBaseView({super.key});

  @override
  State<OnboardingBaseView> createState() => _OnboardingBaseViewState();
}

class _OnboardingBaseViewState extends State<OnboardingBaseView> {
  ValueNotifier<bool> canAnimate = false.notifier;
  ValueNotifier<int> target = 0.notifier;
  ValueNotifier<int> duration = 2000.notifier;
  PageController textViewController = PageController();
  PageController backgroundViewController = PageController();
  ValueNotifier<int> pageIndex = 0.notifier;

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
        child: pageIndex.sync(
          builder: (context, value, child) => Stack(
            children: [
              //! animated backgrounds
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: backgroundViewController,
                onPageChanged: (value) => pageIndex.value = value,
                itemCount: 5,
                pageSnapping: true,
                itemBuilder: (context, index) => View1(
                  backgroundViewController: backgroundViewController,
                  textViewController: textViewController,
                  lottie: '${index + 1}',
                  pageIndex: pageIndex,
                ),
                // Lottie.asset(
                //   ('${index + 1}').lottie,
                //   repeat: false,
                //   fit: BoxFit.fill,
                // ),
              ),

              //! indicator

              OnboardingProgressIndicator(
                pageIndex: pageIndex,
                duration: 10000,
              ),

              //! texts
              OnboardingText(controller: textViewController),

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
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            fadeTo(context, const SignUpView());
                          },
                          child: SizedBox(
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
                        ),
                        AnimatedButton(
                          loadingWidth: 65.w,
                          onTap: () async {
                            switch (pageIndex.value) {
                              case 0:
                                backgroundViewController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                                textViewController.animateToPage(
                                  1,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn,
                                );
                                break;

                              case 1:
                                backgroundViewController.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                                textViewController.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn,
                                );
                                break;

                              case 2:
                                backgroundViewController.animateToPage(
                                  3,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                                textViewController.animateToPage(
                                  3,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn,
                                );
                                break;

                              case 3:
                                backgroundViewController.animateToPage(
                                  4,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                                textViewController.animateToPage(
                                  4,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.easeIn,
                                );
                                break;

                              default:
                                fadeTo(context, const SignUpView());
                            }
                          },
                          content: Text(
                            'GET STARTED',
                            style: TextStyle(
                              color: const Color(0xFF006838),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          isLoading: pageIndex.value != 4,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
