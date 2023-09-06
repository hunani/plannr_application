import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../gues_messages_screen.dart';
import '../model/edit_contact_model.dart';
import '../model/guest_ny_rsvp_model.dart';

class GuestByRsvpController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<GuestByRsvpList> eventOverviewDataList = [];

  Future<UiResult<bool>> guestByRsvp(int invitationId) async {
    try {
      isLoading = true;
      update();
      EasyLoading.show();
      final response = await userRepo.guestByRsvp(invitationId);
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

  @override
  void onInit() {
    guestByRsvp(Get.arguments);
    super.onInit();
  }
}
