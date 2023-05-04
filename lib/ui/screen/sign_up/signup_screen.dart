import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/sign_up/sign_up_verification.dart';

import '../../../const/app_color.dart';
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
  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        backgroundColor: AppColor.kScreenColor,
        body: SingleChildScrollView(
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
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Text(
                      "create your new account and find more beautiful destinations",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 30),
                  text("Name"),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          controller: nameController,
                          decoration: InputDecoration(
                              hintText: "First Name",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: TextFormField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
                          controller: lastController,
                          decoration: InputDecoration(
                              hintText: "Last Name",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  text("Phone Number"),
                  TextFormField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(color: Color(0xffABB3BB))),
                  ),
                  SizedBox(height: 30),
                  text("Email"),
                  TextFormField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Enter your email",
                        hintStyle: TextStyle(color: Color(0xffABB3BB))),
                  ),
                  SizedBox(height: 30),
                  text("Password"),
                  TextFormField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    controller: passwordController,
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
                  SizedBox(height: 30),
                  text("Re-type"),
                  TextFormField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    controller: nameController,
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
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.check_box_outline_blank),
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
                  SizedBox(height: 20),
                  Image.asset(AppAssets.orImage),
                  SizedBox(height: 20),
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
                    onTap: () {
                      Get.toNamed(SignUpVerificationScreen.routeName);
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
