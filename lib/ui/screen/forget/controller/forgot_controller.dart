import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';

class ForgotController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  UiFailure? uiFailure;

  Future<UiResult<bool>> forgot() async {
    try {
      await userRepo.forgotPassword(
        emailController.text.trim(),
      );
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> otp() async {
    try {
      await userRepo.otpVerification(
        emailController.text.trim(),
        otpController.text.trim(),
      );
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<UiResult<bool>> reset() async {
    try {
      await userRepo.resetPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
        confirmPasswordController.text.trim(),
      );
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }
}
