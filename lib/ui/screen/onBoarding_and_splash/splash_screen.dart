import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import 'onBoarding_screen.dart';

class Splash extends StatefulWidget {
  static const String routeName = '/Splash';
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  NextPage() async {
    Timer(
      const Duration(seconds: 3),
      () => Get.toNamed(OnBoardingScreen.routeName),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    NextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Center(
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
      ),
    );
  }
}
