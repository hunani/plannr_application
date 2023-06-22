import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
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
  bool view2 = true;
  @override
  void dispose() {
    Get.delete<RegisterController>();
    super.dispose();
  }

  RegisterController controller = Get.find<RegisterController>();

  bool _isPsaaword = false;
  bool _hasPsaaword = false;

  onPassword(String password) {
    final numericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    setState(() {
      _isPsaaword = false;
      if (password.length >= 8) _isPsaaword = true;

      _hasPsaaword = false;
      if (numericRegex.hasMatch(password)) _hasPsaaword = true;
    });
  }

  String? validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Include both lower and upper case characters \nat least 8 characters long \ninclude at least one number or symbol ';
      } else {
        return null;
      }
    }
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Center(
                              child: Image.asset(
                            AppAssets.appNameImage,
                            fit: BoxFit.cover,
                            height: 70,
                          )),
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
                                validator: (val) => val!.trim().isEmpty ||
                                        controller.lastController.text.isEmpty
                                    ? "Please add You First Name \nand Last Name"
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
                                validator: (val) =>
                                    val!.trim().isEmpty ? "\n" : null,
                                controller: controller.lastController,
                                decoration: InputDecoration(
                                    hintText: "Last Name",
                                    hintStyle:
                                        TextStyle(color: Color(0xffABB3BB))),
                              ),
                            ),
                          ],
                        ),
                        // controller.nameController.text == "" &&
                        //         controller.lastController.text == ""
                        //     ? Text("Please add You First Name and Last Name")
                        //     : Container(),
                        // controller.nameController.text == "" &&
                        //         controller.lastController.text == ""
                        //     ? Text("Please add You First Name and Last Name")
                        //     : Container(),
                        SizedBox(height: 15),
                        text("Phone Number"),
                        TextFormField(
                          validator: (val) =>
                              controller.phoneController.text.length != 10
                                  ? "Please Enter Valid Phone Number"
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
                          validator: (val) => EmailValidator.validate(val!)
                              ? null
                              : "Please Enter Valid Email",
                          controller: controller.emailController,
                          decoration: InputDecoration(
                              hintText: "Enter your email",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                        SizedBox(height: 15),
                        text("Password"),
                        TextFormField(
                          validator: (val) => validatePassword(val!),
                          controller: controller.passwordController,
                          onChanged: (password) => onPassword(password),
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
                        // SizedBox(height: 15),
                        // Row(
                        //   children: [
                        //     AnimatedContainer(
                        //       duration: Duration(milliseconds: 500),
                        //       width: 20,
                        //       height: 20,
                        //       decoration: BoxDecoration(
                        //         color: _isPsaaword
                        //             ? Colors.green
                        //             : Colors.transparent,
                        //         border: _isPsaaword
                        //             ? Border.all(color: Colors.transparent)
                        //             : Border.all(color: Colors.black),
                        //         borderRadius: BorderRadius.circular(50),
                        //       ),
                        //       child: Center(
                        //           child: Icon(
                        //         Icons.check,
                        //         color: Colors.white,
                        //         size: 15,
                        //       )),
                        //     ),
                        //     SizedBox(width: 10),
                        //     text("be at least 8 characters long."),
                        //   ],
                        // ),
                        // SizedBox(height: 10),
                        // Row(
                        //   children: [
                        //     AnimatedContainer(
                        //       duration: Duration(milliseconds: 500),
                        //       width: 20,
                        //       height: 20,
                        //       decoration: BoxDecoration(
                        //         color: _hasPsaaword
                        //             ? Colors.green
                        //             : Colors.transparent,
                        //         border: _hasPsaaword
                        //             ? Border.all(color: Colors.transparent)
                        //             : Border.all(color: Colors.black),
                        //         borderRadius: BorderRadius.circular(50),
                        //       ),
                        //       child: Center(
                        //           child: Icon(
                        //         Icons.check,
                        //         color: Colors.white,
                        //         size: 15,
                        //       )),
                        //     ),
                        //     SizedBox(width: 10),
                        //     text(
                        //         "Include both lower and upper case characters."),
                        //   ],
                        // ),
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
                                  view2 = true;
                                  setState(() {});
                                },
                                child: view == true
                                    ? Icon(Icons.check_box)
                                    : Icon(
                                        Icons.check_box_outline_blank,
                                        color: view2 == false
                                            ? Colors.red
                                            : Colors.black,
                                      )),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                "By creating an account you agree to our Terms of Service and Privacy Policy",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: view2 == false
                                        ? Colors.red
                                        : Colors.black),
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
                                    Fluttertoast.showToast(
                                      msg: message!,
                                      gravity: ToastGravity.CENTER,
                                      textColor: Colors.red,
                                      backgroundColor: Colors.black38,
                                    );
                                  },
                                );
                              } else {
                                view2 = false;
                                setState(() {});
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
