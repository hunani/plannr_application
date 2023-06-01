import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../../../../widget/app_prefs.dart';

class LoginController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UiFailure? uiFailure;

  Future<UiResult<bool>> signIn() async {
    try {
      final response = await userRepo.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      GetIt.I.get<AppPrefs>().setUser(response);
      GetIt.I.get<AppPrefs>().setOnBoardingStatus = true;
      print("=======================> ${response.token}");
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }
}
