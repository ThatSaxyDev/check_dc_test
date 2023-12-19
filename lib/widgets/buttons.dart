import 'package:check_dc/palette/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return IgnorePointer(
      ignoring: isLoading,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
          height: height ?? 44.h,
          width: isLoading
              ? switch (loadingWidth == null) {
                  true => 44.w,
                  false => loadingWidth,
                }
              : switch (width == null) {
                  true => 327.w,
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
                        true => 20.r,
                        false => 20.r,
                      },
              ),
              border: border),
          child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                  width: isLoading
                      ? switch (loadingWidth == null) {
                          true => 44.w,
                          false => loadingWidth,
                        }
                      : switch (width == null) {
                          true => 327.w,
                          false => width,
                        },
                  child: Center(
                      child: isLoading
                          ? const Icon(Icons.arrow_forward_ios_rounded)
                          : content))),
        ),
      ),
    );
  }
}
