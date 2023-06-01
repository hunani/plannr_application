import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/core/repository/user_repository.dart';
import 'package:plannr_app/core/ui_failure/ui_result.dart';
import 'package:plannr_app/core/utils/error_util.dart';

class RegisterController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypeController = TextEditingController();

  UiFailure? uiFailure;

  Future<UiResult<bool>> signUp() async {
    try {
      await userRepo.register(
        nameController.text.trim(),
        lastController.text.trim(),
        phoneController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        retypeController.text.trim(),
      );
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> otp(String otp) async {
    try {
      await userRepo.otpVerification(
        emailController.text.trim(),
        otp,
      );
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }
}
