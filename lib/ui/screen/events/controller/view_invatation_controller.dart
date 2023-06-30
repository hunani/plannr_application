import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/events/model/view_invitation_model.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../../../../widget/global.dart';
import '../../categories/model/create_model.dart';
import '../../home/model/categories_model.dart';
import '../model/invitation_model.dart';

class EventsCreateController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  ViewInvitatioData? inDataList;
  Future<UiResult<bool>> invitationDataList(int id) async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response =
          await userRepo.viewInvitation(id, appController.loginModel!.userId);
      inDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }
}
