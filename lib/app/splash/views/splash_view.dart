import 'package:check_dc/app/onboarding/views/onbosrding_base_view.dart';
import 'package:check_dc/contd.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: (5)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Lottie.asset(
          'Splash'.lottie,
          controller: _controller,
          height: height(context),
          animate: true,
          fit: BoxFit.fill,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward()
                  .whenComplete(() => fadeTo(context, const OnboardingBaseView()));
          },
        ),
      ),
    );
  }
}
