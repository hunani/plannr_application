import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/sign_up/controller/register_controller.dart';
import 'package:plannr_app/ui/screen/sign_up/sign_up_done.dart';

import '../../../const/app_icon.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';

class SignUpVerificationScreen extends StatefulWidget {
  static const String routeName = '/signUpVerificationScreen';
  const SignUpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<SignUpVerificationScreen> createState() =>
      _SignUpVerificationScreenState();
}

class _SignUpVerificationScreenState extends State<SignUpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  void dispose() {
    Get.delete<RegisterController>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        backgroundColor: AppColor.kScreenColor,
        resizeToAvoidBottomInset: false,
        body: GetBuilder(
          builder: (RegisterController controller) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.transparent,
                          child: Center(
                              child: Image.asset(
                            AppAssets.appNameImage,
                            fit: BoxFit.cover,
                          ))),
                    ),
                    Center(
                      child: Text(
                        "Check your email",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 25),
                      ),
                    ),
                    SizedBox(height: 15),
                    Center(
                      child: Text(
                        "We’ve sent the code to the email on your device",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 30),
                    Image.asset(AppAssets.mailImage, height: 120),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: PinCodeTextField(
                        cursorColor: Colors.black,
                        backgroundColor: Colors.transparent,
                        appContext: context,
                        length: 4,
                        animationType: AnimationType.fade,
                        blinkWhenObscuring: true,
                        pastedTextStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        pinTheme: PinTheme(
                          activeColor: Color(0xffCACACA),
                          inactiveColor: Color(0xffCACACA),
                          inactiveFillColor: Color(0xffCACACA),
                          selectedFillColor: Color(0xffCACACA),
                          activeFillColor: Color(0xffCACACA),
                          disabledColor: Color(0xffCACACA),
                          selectedColor: Color(0xffCACACA),
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10),
                          fieldHeight: 60,
                          fieldOuterPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          fieldWidth: 60,
                        ),
                        // animationDuration: const Duration(milliseconds: 300),
                        controller: otpController,
                        onChanged: (otp) {},
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                      ),
                    ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () async {
                        EasyLoading.show();
                        final response = await controller.resendOtp();
                        EasyLoading.dismiss();
                        response.when(
                          success: (data) {
                            showToast(
                                "Resend OTP Send Successfully", Colors.red);
                          },
                          failure: (ErrorType type, String? message) {
                            showToast(message!, Colors.red);
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn’t receive code? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Resend Code",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () async {
                        if (otpController.text.length == 4) {
                          EasyLoading.show();
                          final response =
                              await controller.otp(otpController.text);
                          EasyLoading.dismiss();
                          response.when(
                            success: (data) {
                              Get.toNamed(SignUpDone.routeName);
                            },
                            failure: (ErrorType type, String? message) {
                              showToast("Invalid Otp", Colors.red);
                            },
                          );
                        } else {
                          showToast("Please Enter Otp", Colors.red);
                        }
                        print("====>${otpController.text.length}");
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.kTextColor,
                        ),
                        child: Center(
                          child: Text(
                            "Verify",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
