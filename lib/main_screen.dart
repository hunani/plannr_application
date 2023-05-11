import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/splash/splash_screen.dart';

import 'const/app_icon.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/mainScreen';
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: GestureDetector(
        onTap: () {
          Get.toNamed(SplashScreen.routeName);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AppAssets.appNameImage,
                height: 300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
