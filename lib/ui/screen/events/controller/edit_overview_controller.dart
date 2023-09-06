import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/events/model/rsvp_count_model.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../model/edit_contact_model.dart';

class EditOverviewController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<EventOverviewList> eventOverviewDataList = [];
  Future<UiResult<bool>> eventOverviewData(int id) async {
    try {
      isLoading = true;
      update();
      EasyLoading.show();
      final response = await userRepo.editOverview(id);
      eventOverviewDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  Future<UiResult<bool>> cancelEventData(
      int userId, int eventId, String cancel) async {
    try {
      await userRepo.cancelEvent(userId, eventId, cancel);
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  List<RsvpCountList> rsvpCountDataList = [];
  Future<UiResult<bool>> rsvpCountData(int invitationId) async {
    try {
      isLoading = true;
      update();
      EasyLoading.show();
      final response = await userRepo.rsvpCount(invitationId);
      rsvpCountDataList = response;
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
    eventOverviewData(Get.arguments);
    rsvpCountData(Get.arguments);
    super.onInit();
  }
}
