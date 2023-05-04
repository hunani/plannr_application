import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/ui/screen/forget/forgot_verification.dart';
import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class ForgotScreen extends StatefulWidget {
  static const String routeName = '/forgotScreen';
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Forgot Password",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    "We will send a mail to the email address you registered to regain your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                TextFormField(
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      hintStyle: TextStyle(color: Color(0xffABB3BB))),
                ),
                SizedBox(height: 100),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(ForgotVerificationScreen.routeName);
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
                        "Send",
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
      ),
    );
  }
}
