import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/profile/model/contact_us_model.dart';
import 'package:plannr_app/ui/screen/profile/model/faq_model.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';

class ContactUsController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  File? _imagePath;

  File? get imagePath => _imagePath;

  set imagePath(File? value) {
    _imagePath = value;
    update();
  }

  List<ContactUsData> contactUsDataList = [];
  Future<UiResult<bool>> contactUsData() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.contactUs();
      contactUsDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  @override
  void onInit() {
    contactUsData();
    super.onInit();
  }
}
