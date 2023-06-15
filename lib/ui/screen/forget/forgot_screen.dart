import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:plannr_app/ui/screen/forget/controller/forgot_controller.dart';
import 'package:plannr_app/ui/screen/forget/forgot_verification.dart';
import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../../../const/dispose_keyboard.dart';
import '../../../core/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';

class ForgotScreen extends StatefulWidget {
  static const String routeName = '/forgotScreen';
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    Get.delete<ForgotController>();
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
        body: Form(
          key: formKey,
          child: GetBuilder(
            builder: (ForgotController controller) {
              return SafeArea(
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
                      SizedBox(height: 30),
                      Text(
                        "Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      TextFormField(
                        validator: (val) => val!.trim().isEmpty
                            ? "Please Enter Valid Email"
                            : null,
                        controller: controller.emailController,
                        decoration: InputDecoration(
                            hintText: "Enter your Email",
                            hintStyle: TextStyle(color: Color(0xffABB3BB))),
                      ),
                      SizedBox(height: 50),
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
                                Get.toNamed(ForgotVerificationScreen.routeName);
                              },
                              failure: (ErrorType type, String? message) {
                                showToast(message!, Colors.red);
                              },
                            );
                          } else {
                            showToast("field required", Colors.red);
                            // Fluttertoast.showToast(
                            //   msg: "field required",
                            //   toastLength: Toast.LENGTH_SHORT,
                            //   gravity: ToastGravity.CENTER,
                            //   timeInSecForIosWeb: 1,
                            //   textColor: Colors.red,
                            // );
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
                              "Send OTP",
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
              );
            },
          ),
        ),
      ),
    );
  }
}
