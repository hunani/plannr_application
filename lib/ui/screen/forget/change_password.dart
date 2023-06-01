import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:plannr_app/ui/screen/forget/controller/forgot_controller.dart';
import 'package:plannr_app/ui/screen/forget/password_done.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../../../const/dispose_keyboard.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';

class ChangePassword extends StatefulWidget {
  static const String routeName = '/changePassword';
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool hidePassword = true;
  bool retypePassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
            builder: (ForgotController controller) {
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
                            "Forgot Password",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 25),
                          ),
                        ),
                        SizedBox(height: 15),
                        Center(
                          child: Text(
                            "We will send a mail to the email address you registered to regain your password",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          "New Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        TextFormField(
                          validator: (val) =>
                              val!.trim().isEmpty ? "field required" : null,
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
                        SizedBox(height: 30),
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        TextFormField(
                          validator: (val) => val!.trim().isEmpty
                              ? "field required"
                              : val.trim() ==
                                      controller.passwordController.text.trim()
                                  ? null
                                  : "password not match",
                          controller: controller.confirmPasswordController,
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
                              hintText: "Enter your confirm password",
                              hintStyle: TextStyle(color: Color(0xffABB3BB))),
                        ),
                        SizedBox(height: 30),
                        SizedBox(height: 100),
                        GestureDetector(
                          onTap: () async {
                            disposeKeyboard();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              EasyLoading.show();
                              final response = await controller.forgot();
                              EasyLoading.dismiss();
                              response.when(
                                success: (data) {
                                  Get.toNamed(PasswordDone.routeName);
                                },
                                failure: (ErrorType type, String? message) {
                                  showToast(getMessageFromErrorType(type));
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
                                "Save",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
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
}
