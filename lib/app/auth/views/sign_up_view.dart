import 'package:check_dc/contd.dart';
import 'package:check_dc/palette/palette.dart';
import 'package:check_dc/widgets/buttons.dart';
import 'package:check_dc/widgets/my_icon.dart';
import 'package:check_dc/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  ValueNotifier<String> selectedDate = 'Select Date'.notifier;
  ValueNotifier<String> selectedGender = 'Select Gender'.notifier;
  ValueNotifier<bool> isLoading = false.notifier;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: Stack(
          children: [
            //! background
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width(context),
                height: 600.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('signupback'.png), fit: BoxFit.fill),
                ),
              ),
              // SvgPicture.asset(
              //   'signupback'.svg,
              //   width: width(context),
              //   // height: 500.h,
              // ),
            ),

            //! body
            SizedBox(
              height: height(context),
              width: width(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: 30.padH,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      90.sbH,
                      Text(
                        'LET\'S GET YOU STARTED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: darkerGreen,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      8.sbH,
                      Text(
                        'Personal Information',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: green,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      25.sbH,

                      //! indicator
                      SizedBox(
                        width: 95.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            3,
                            (index) => Container(
                              width: 26.w,
                              height: index == 0 ? 4.h : 2.h,
                              color: index == 0
                                  ? const Color(0xFF006838)
                                  : const Color(0x19006838),
                            ),
                          ),
                        ),
                      ),
                      189.sbH,

                      //! first name input,
                      TextInputWidget(
                        inputTitle: 'FIRST NAME',
                        hintText: 'Ciroma',
                        controller: _firstNameController,
                      ),
                      20.sbH,

                      //! last name input,
                      TextInputWidget(
                        inputTitle: 'LAST NAME',
                        hintText: 'Adekunle',
                        controller: _lastNameController,
                      ),
                      20.sbH,

                      //! gender selection
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'GENDER',
                          style: TextStyle(
                            color: darkGreen,
                            fontSize: 10.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      10.sbH,
                      InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () async {
                          await showGeneralDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierLabel: "Sex",
                            barrierColor: neutralBlack.withOpacity(0.2),
                            transitionBuilder: (context, a1, a2, widget) =>
                                Dialog(
                              elevation: 65.0.h,
                              child: Container(
                                height: 100.h * a1.value,
                                width: 330.w,
                                decoration: BoxDecoration(
                                  color: neutralWhite,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: List.generate(
                                      gender.length,
                                      (index) => InkWell(
                                        onTap: () {
                                          selectedGender.value = gender[index];
                                          goBackk(context);
                                        },
                                        child: Container(
                                          width: 330.w,
                                          height: 50.h,
                                          decoration: BoxDecoration(
                                            color: gender[index] ==
                                                    selectedGender.value
                                                ? const Color(0x7FD9D9D9)
                                                : Colors.white,
                                          ),
                                          child: Center(
                                            child: Text(
                                              gender[index],
                                              style: TextStyle(
                                                color: neutralBlack,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            transitionDuration:
                                const Duration(milliseconds: 200),
                            pageBuilder: (context, animation1, animation2) =>
                                const Text(""),
                          );
                        },
                        child: selectedGender.sync(
                          builder: (context, value, child) => Container(
                            width: width(context),
                            height: 50.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            padding: 20.padH,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedGender.value,
                                  style: TextStyle(
                                    color: const Color(0x563C2415),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: darkGreen,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      20.sbH,

                      //! date selection
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'DATE OF BIRTH',
                          style: TextStyle(
                            color: darkGreen,
                            fontSize: 10.sp,
                            fontFamily: 'Gotham',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      10.sbH,
                      selectedDate.sync(
                        builder: (context, value, child) => InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () async {
                            DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());

                            if (newDate != null) {
                              String day =
                                  newDate.day.toString().padLeft(2, '0');

                              String month =
                                  newDate.month.toString().padLeft(2, '0');

                              String year = newDate.year.toString();
                              selectedDate.value = '$year/$month/$day';
                            }
                          },
                          child: Container(
                            width: width(context),
                            height: 50.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                            ),
                            padding: 20.padH,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedDate.value,
                                  style: TextStyle(
                                    color: selectedDate.value == 'Select Date'
                                        ? const Color(0x563C2415)
                                        : darkGreen,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                MyIcon(
                                  icon: 'calendar',
                                  height: 14.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      25.sbH,
                      isLoading.sync(
                        builder: (context, value, child) => LottieButton(
                          onTap: () {
                            isLoading.value = !isLoading.value;
                          },
                          text: 'NEXT',
                          isLoading: isLoading.value,
                        ),
                      ),

                      11.sbH,
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Have an account? ',
                              style: TextStyle(
                                color: const Color(0xFF002E17),
                                fontSize: 12.sp,
                              ),
                            ),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: const Color(0xFF006838),
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      60.sbH,
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

List<String> gender = ['Male', 'Female'];
