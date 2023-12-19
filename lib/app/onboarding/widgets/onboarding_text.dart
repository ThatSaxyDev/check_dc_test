// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:check_dc/contd.dart';
import 'package:check_dc/palette/palette.dart';

class OnboardingText extends StatelessWidget {
  final PageController controller;
  const OnboardingText({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: width(context),
      margin: EdgeInsets.only(top: 150.h),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          5,
          (index) => Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: switch (index) {
                          0 => 'Fund\n',
                          1 => 'Save\n',
                          2 => 'Send\n',
                          3 => 'Buy\n',
                          _ => 'Pay\n',
                        },
                        style: TextStyle(
                          color: green,
                          fontWeight: FontWeight.w500,
                          fontSize: 45.sp,
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: switch (index) {
                          0 => 'Account',
                          1 || 2 => 'Money',
                          3 => 'Airtime',
                          _ => 'Bills',
                        },
                        style: TextStyle(
                          color: green,
                          fontSize: 45.sp,
                          fontWeight: FontWeight.w300,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                20.sbH,
                SizedBox(
                  width: 191.w,
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam aliquet mollis sem, non varius libero',
                    style: TextStyle(
                      color: neutralBlack,
                      fontSize: 15.sp,
                      fontFamily: 'Gotham',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
