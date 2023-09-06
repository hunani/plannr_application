import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/events/model/add_guests_model.dart';
import 'package:plannr_app/ui/screen/events/model/edit_Invitation_model.dart';
import 'package:plannr_app/widget/global.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../../home/model/categories_model.dart';

class AddGuestsController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<AddGustsList> addGustsDataList = [];
  Future<UiResult<bool>> categoriesData() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.addMoreGuests(
          Get.arguments, appController.loginModel!.userId);
      addGustsDataList = response;
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
    categoriesData();
    super.onInit();
  }
}
