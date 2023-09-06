import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/widget/global.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../model/past_model.dart';
import '../model/upcoming_model.dart';

class UpcomingController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<UpcomingList> upcomingDataList = [];
  Future<UiResult<bool>> upcomingData() async {
    try {
      isLoading = true;
      update();
      EasyLoading.show();
      final response =
          await userRepo.upcomingDataList(appController.loginModel!.userId);
      print("<<<<<<<<<<<object>>>>>>>>>>>${appController.loginModel!.userId}");
      upcomingDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  List<PastList> pastDataList = [];
  Future<UiResult<bool>> pastData() async {
    try {
      isLoading = true;
      update();
      EasyLoading.show();
      final response =
          await userRepo.pastDataList(appController.loginModel!.userId);
      print("<<<<<<<<<<<object>>>>>>>>>>>${appController.loginModel!.userId}");
      pastDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  Future<UiResult<bool>> draftDelete(int eventId) async {
    try {
      await userRepo.draftDelete(eventId, appController.loginModel!.userId);
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      update();
    }
  }

  @override
  void onInit() {
    upcomingData();
    pastData();
    super.onInit();
  }
}
