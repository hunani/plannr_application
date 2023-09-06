import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../../../../widget/global.dart';
import '../../categories/model/create_list_model.dart';
import '../gues_messages_screen.dart';
import '../model/edit_contact_model.dart';
import '../model/guest_list_yes_no_model.dart';
import '../model/guest_ny_rsvp_model.dart';

class GuestListController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<GuestListYesNoList> createListDataList = [];
  Future<UiResult<bool>> createListData() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.guestListYesNo(
          Get.arguments, appController.loginModel!.userId);
      createListDataList = response;
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
    createListData();
    super.onInit();
  }
}
