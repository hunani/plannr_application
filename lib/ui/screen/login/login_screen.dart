import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/forget/forgot_screen.dart';
import 'package:plannr_app/ui/screen/login/controller/login_controller.dart';
import 'package:plannr_app/ui/screen/login/properties_screen.dart';
import 'package:plannr_app/ui/screen/sign_up/signup_screen.dart';
import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColor.kScreenColor,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: GetBuilder(
              builder: (LoginController controller) {
                return Padding(
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
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                      ),
                      SizedBox(height: 30),
                      text("Email"),
                      TextFormField(
                        validator: (val) => EmailValidator.validate(val!)
                            ? null
                            : "Please Enter Valid E-Mail",
                        controller: controller.emailController,
                        decoration: InputDecoration(
                            hintText: "Enter your email",
                            hintStyle: TextStyle(color: Color(0xffABB3BB))),
                      ),
                      SizedBox(height: 15),
                      text("Password"),
                      TextFormField(
                        validator: (val) => val!.trim().isEmpty
                            ? "Please Enter Correct Password"
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
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(ForgotScreen.routeName);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
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
                        onTap: () async {
                          disposeKeyboard();
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            EasyLoading.show();
                            final response = await controller.signIn();
                            EasyLoading.dismiss();
                            response.when(
                              success: (data) {
                                Get.toNamed(PropertiesScreen.routeName);
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
                              "Sign In",
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
                            'Don’t have an account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(SignUpScreen.routeName);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
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
