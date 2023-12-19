// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import 'package:check_dc/contd.dart';
import 'package:check_dc/palette/palette.dart';

class AnimatedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? loadingWidth;
  final double? radius;
  final void Function()? onTap;
  final Widget content;
  final Color? color;
  final BoxBorder? border;
  final bool isLoading;
  const AnimatedButton({
    Key? key,
    this.height,
    this.loadingWidth,
    this.width,
    this.radius,
    this.onTap,
    required this.content,
    this.color,
    this.border,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn,
        height: isLoading
            ? switch (loadingWidth == null) {
                true => 50.w,
                false => loadingWidth,
              }
            : switch (width == null) {
                true => 65.w,
                false => height,
              },
        width: isLoading
            ? switch (loadingWidth == null) {
                true => 44.w,
                false => loadingWidth,
              }
            : switch (width == null) {
                true => 169.w,
                false => width,
              },
        decoration: BoxDecoration(
            color: color ?? neutralWhite,
            borderRadius: BorderRadius.circular(
              isLoading
                  ? switch (loadingWidth == null) {
                      true => 44.w,
                      false => loadingWidth!,
                    }
                  : switch (width == null) {
                      true => 30.r,
                      false => 30.r,
                    },
            ),
            border: border),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
                width: isLoading
                    ? switch (loadingWidth == null) {
                        true => 65.w,
                        false => loadingWidth,
                      }
                    : switch (width == null) {
                        true => 169.w,
                        false => width,
                      },
                child: Center(
                    child: isLoading
                        ? const Icon(Icons.arrow_forward_ios_rounded)
                        : content))),
      ),
    );
  }
}

//! lottie button
class LottieButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? radius;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Color? color;
  final Widget? item;
  final String? text;
  final bool isText;
  final Color? textColor;
  final Color? borderColor;
  final bool showBorder;
  final bool isLoading;
  const LottieButton({
    Key? key,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.radius,
    required this.onTap,
    this.onLongPress,
    this.color,
    this.item,
    this.text,
    this.isText = true,
    this.textColor,
    this.borderColor,
    this.showBorder = false,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 315.w,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(-0.3, 0),
            child: SizedBox(
              height: height ?? 45.h,
              width: width ?? 300.w,
              child: ElevatedButton(
                onPressed: onTap,
                onLongPress: onLongPress,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: showBorder
                          ? (borderColor ?? neutralBlack.withOpacity(0.5))
                          : Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(radius ?? 25.r),
                    ),
                  ),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: color ?? green,
                ),
                child: Center(
                  child: isText == true
                      ? Text(
                          text ?? '',
                          style: TextStyle(
                            fontSize: fontSize ?? 12.sp,
                            fontWeight: fontWeight ?? FontWeight.w700,
                            color: textColor ?? neutralWhite,
                          ),
                        )
                      : item,
                ),
              ),
            ),
          ),
          if (isLoading)
            Align(
              alignment: Alignment.center,
              child: IgnorePointer(
                ignoring: true,
                child: SizedBox(
                  height: height ?? 50.h,
                  width: width ?? 315.w,
                  child: Lottie.asset(
                    'Loading Animation'.lottie,
                    fit: BoxFit.fill,
                    animate: isLoading,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
