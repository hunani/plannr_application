import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/login/mode/upgrade_now_model.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../../../../widget/app_prefs.dart';

class SubscriptionController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<SubscriptionList> subList = [];
  Future<UiResult<bool>> subscription() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.subscriptionData();
      subList = response;
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      EasyLoading.dismiss();
      isLoading = false;
    }
  }

  @override
  void onInit() {
    subscription();
    super.onInit();
  }
}
