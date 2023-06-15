import 'dart:developer';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/dashboad/dashboad_screen.dart';
import 'package:plannr_app/ui/screen/sign_up/signup_screen.dart';
import '../ui/screen/onBoarding_and_splash/splash_screen.dart';
import 'app_controller.dart';
import 'app_prefs.dart';

AppController appController = Get.find<AppController>();

String get getInitialRoute {
  if (GetIt.I.get<AppPrefs>().onBoardingStatus) {
    SignUpScreen.routeName;
    if (appController.loginModel != null) {
      log("User Model ====> ${appController.loginModel}");
      return DashboadScreen.routeName;
    } else {
      return SignUpScreen.routeName;
    }
  } else {
    return Splash.routeName;
  }
}
