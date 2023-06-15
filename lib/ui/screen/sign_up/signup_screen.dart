import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/sign_up/controller/register_controller.dart';
import 'package:plannr_app/ui/screen/sign_up/sign_up_verification.dart';

import '../../../const/app_color.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signUpScreen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool hidePassword = true;
  bool retypePassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool view = false;
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
        body: Form(
          key: formKey,
          child: GetBuilder(
            builder: (RegisterController controller) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Let's get started",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: Text(
                            "create your new account and find more beautiful destinations",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 20),
                        text("Name"),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (val) => val!.trim().isEmpty
                                    ? "Please Enter correct First Name".tr
                                    : null,
                                controller: controller.nameController,
                                decoration: InputDecoration(
                                    hintText: "First Name",
                                    hintStyle:
                                        TextStyle(color: Color(0xffABB3BB))),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: TextFormField(
                                validator: (val) => val!.trim().isEmpty
                                    ? "Please Enter correct Last Name".tr
                                    : null,
                                controller: controller.lastController,
                                decoration: InputDecoration(
                                    hintText: "Last Name",
                                    hintStyle:
                                        TextStyle(color: Color(0xffABB3BB))),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        text("Phone Number"),
                        TextFormField(
                          validator: (val) => val!.trim().isEmpty
                              ? "Please Enter Valid Phone Number".tr
                              : null,
                          controller: controller.phoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              hintText: "Enter your phone number",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                        text("Email"),
                        TextFormField(
                          validator: (val) => val!.trim().isEmpty
                              ? "Please Enter Valid Email".tr
                              : null,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                        SizedBox(height: 15),
                        text("Password"),
                        TextFormField(
                          validator: (val) => val!.trim().isEmpty
                              ? "Please Enter Password".tr
                              : null,
                          controller: controller.passwordController,
                          obscureText: hidePassword,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: hidePassword
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: AppColor.kTextColor,
                                        size: 21,
                                      )
                                    : Icon(
                                        Icons.visibility_outlined,
                                        color: AppColor.kTextColor,
                                        size: 21,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = !hidePassword;
                                  });
                                },
                              ),
                              hintText: "Enter your password",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                        SizedBox(height: 15),
                        text("Re-type"),
                        TextFormField(
                          validator: (val) => val!.trim().isEmpty
                              ? "Please Enter your confirmation password"
                              : val.trim() ==
                                      controller.passwordController.text.trim()
                                  ? null
                                  : "password not match",
                          controller: controller.retypeController,
                          obscureText: retypePassword,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: retypePassword
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: AppColor.kTextColor,
                                        size: 21,
                                      )
                                    : Icon(
                                        Icons.visibility_outlined,
                                        color: AppColor.kTextColor,
                                        size: 21,
                                      ),
                                onPressed: () {
                                  setState(() {
                                    retypePassword = !retypePassword;
                                  });
                                },
                              ),
                              hintText: "Re-type password",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                        SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  view = !view;
                                  setState(() {});
                                },
                                child: view == true
                                    ? Icon(Icons.check_box)
                                    : Icon(Icons.check_box_outline_blank)),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "By creating an account you agree to our Terms of Service and Privacy Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        //SizedBox(height: 20),
                        //Image.asset(AppAssets.orImage),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.googleImage1, height: 55),
                            SizedBox(width: 20),
                            Image.asset(AppAssets.faceboookImage, height: 65),
                          ],
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              if (view == true) {
                                EasyLoading.show();
                                final response = await controller.signUp();
                                EasyLoading.dismiss();
                                response.when(
                                  success: (data) {
                                    Get.toNamed(
                                        SignUpVerificationScreen.routeName);
                                  },
                                  failure: (ErrorType type, String? message) {
                                    showToast(message!, Colors.red);
                                  },
                                );
                              } else {
                                showToast(
                                    "Please check the terms and conditions box to continue",
                                    Colors.red);
                              }
                            }
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
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(LoginScreen.routeName);
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget text(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }
}
