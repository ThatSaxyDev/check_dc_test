// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:check_dc/palette/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String inputTitle;
  final String hintText;
  final bool hastitle;
  final bool? filled;
  final bool readOnly;
  final Color? fillColor;
  final TextEditingController controller;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final void Function(String)? onFieldSubmitted;
  final Widget? suffix;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Color? titleColor;
  final Color? borderColor;
  final FontWeight? titleFontWeight;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? iconn;
  final int? maxLength;
  final int? maxLines;
  final Widget? cardIcon;
  const TextInputWidget({
    Key? key,
    this.height,
    this.width,
    required this.inputTitle,
    required this.hintText,
    this.hastitle = true,
    this.filled,
    this.readOnly = false,
    this.fillColor,
    required this.controller,
    this.obscuretext = false,
    this.validator,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.suffix,
    this.focusNode,
    this.keyboardType,
    this.onChanged,
    this.onSaved,
    this.inputFormatters,
    this.titleColor,
    this.borderColor,
    this.titleFontWeight,
    this.onTap,
    this.onTapOutside,
    this.iconn,
    this.maxLength,
    this.maxLines,
    this.cardIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: SizedBox(
        // color: Colors.red,
        height: 71.h,
        width: width ?? double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              inputTitle,
              style: TextStyle(
                color: darkGreen,
                fontSize: 10.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 50.h,
              child: TextFormField(
                textInputAction: TextInputAction.done,
                readOnly: readOnly,
                maxLines: maxLines,
                maxLength: maxLength,
                onTap: onTap,
                onTapOutside: onTapOutside,
                keyboardType: keyboardType,
                focusNode: focusNode,
                onFieldSubmitted: onFieldSubmitted,
                onChanged: onChanged,
                onSaved: onSaved,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: darkGreen,
                ),
                controller: controller,
                inputFormatters: inputFormatters,
                obscureText: obscuretext,
                obscuringCharacter: '*',
                cursorColor: Colors.black,
                cursorHeight: 16.h,
                decoration: InputDecoration(
                  filled: filled ?? true,
                  fillColor: fillColor ?? neutralWhite,
                  // isDense: true,
                  suffix: suffix,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8.w).copyWith(left: 20.w),
                  helperText: " ",
                  helperStyle: const TextStyle(fontSize: 0.0005),
                  errorStyle: const TextStyle(fontSize: 0.0005),
                  suffixIcon: suffixIcon,
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 20.h, minWidth: 20.w),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: greey,
                    fontSize: 12.sp,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                validator: validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
