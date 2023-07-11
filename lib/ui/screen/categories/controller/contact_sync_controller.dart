import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/home/model/categories_model.dart';
import 'package:plannr_app/widget/global.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../model/contact_model.dart';

class ContactSyncController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<CategoriesList> categoriesDataList = [];

  File? _imagePath;

  File? get imagePath => _imagePath;

  set imagePath(File? value) {
    _imagePath = value;
    update();
  }

  Future<UiResult<bool>> sendContacts(
      List<ContactsListNameAndNumber> list) async {
    try {
      await userRepo.contactSubmit(appController.loginModel!.userId, list);
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }
}
