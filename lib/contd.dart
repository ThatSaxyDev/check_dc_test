import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void goBackk(BuildContext context) {
  FocusManager.instance.primaryFocus?.unfocus();
  Navigator.of(context).pop();
}

//! nav function
void goTo(BuildContext context, Widget view) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) {
        return view;
      }),
    ),
  );
}

void goBackTimes(int countToMove, BuildContext context) {
  int count = 0;
  Navigator.of(context).popUntil((_) => count++ >= countToMove);
}

//! fade page transition
fadeTo(BuildContext context, Widget view) {
  Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return view;
      },
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
          curve: Curves.linearToEaseOut,
          parent: animation,
        );
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      }));
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Extension for creating a ValueNotifier from a value directly.
extension ValueNotifierExtension<T> on T {
  ValueNotifier<T> get notifier {
    return ValueNotifier<T>(this);
  }
}

/// extension for listening to ValueNotifier instances.
extension ValueNotifierBuilderExtension<T> on ValueNotifier<T> {
  Widget sync({
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: builder,
    );
  }
}

extension ListenableBuilderExtension on List<Listenable> {
  Widget multiSync({
    required Widget Function(BuildContext context, Widget? child) builder,
  }) {
    return ListenableBuilder(
      listenable: Listenable.merge(this),
      builder: builder,
    );
  }
}

//! EXTENSIONS ON NUMBER
extension WidgetExtensions on num {
  Widget get sbH => SizedBox(
        height: h,
      );

  Widget get sbW => SizedBox(
        width: w,
      );

  EdgeInsetsGeometry get padV => EdgeInsets.symmetric(vertical: h);

  EdgeInsetsGeometry get padH => EdgeInsets.symmetric(horizontal: w);
}

//! EXTENSIONS ON STRING
extension LottiePath on String {
  String get lottie => 'lib/assets/lottie/$this.json';
}

extension VectorPath on String {
  String get svg => 'lib/assets/svg/$this.svg';
  String get png => 'lib/assets/png/$this.png';
}
