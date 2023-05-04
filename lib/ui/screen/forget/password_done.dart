import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/ui/screen/login/login_screen.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class PasswordDone extends StatelessWidget {
  static const String routeName = '/passwordDone';
  const PasswordDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
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
                "Password Updated",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Text(
                "Your Password Has been Updated Successfully",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            SizedBox(height: 50),
            Image.asset(AppAssets.doneImage, height: 200),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                Get.toNamed(LoginScreen.routeName);
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
          ]),
        ),
      ),
    );
  }
}
