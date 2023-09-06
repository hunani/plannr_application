import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/widget/global.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../model/see_all_participants_model.dart';
import '../model/upcoming_model.dart';

class SellAllParticipantsController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<SeeAllParticipantsList> seeAllParticipantsList = [];
  Future<UiResult<bool>> seeAllParticipantsData(int invitationId, String guest) async {
    try {
      isLoading = true;
      update();
      EasyLoading.show();
      final response =
      await userRepo.seeAllParticipants(invitationId, guest);
      print("<<<<<<<<<<<object>>>>>>>>>>>${appController.loginModel!.userId}");
      seeAllParticipantsList = response;
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
