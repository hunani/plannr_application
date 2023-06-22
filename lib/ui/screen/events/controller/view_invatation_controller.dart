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

class EventsCreateController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  ViewInvitatioData? viewInvitatioData;
  Future<UiResult<bool>> viewData() async {
    try {
      isLoading = true;
      update();
      EasyLoading.show();
      final response = await userRepo.viewInvitation(
          Get.arguments, appController.loginModel!.userId);
      viewInvitatioData = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  List<CategoriesList> categoriesDataList = [];
  Future<UiResult<bool>> categoriesData() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.categories();
      categoriesDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  Future<UiResult<bool>> createInvitation(
      int id,
      String name,
      String date,
      String time,
      String timeZone,
      String hostedBy,
      String location,
      String phone,
      String message,
      String typeEvents,
      String dressCode,
      String food,
      String addInfo,
      String addAdmin,
      String addChatRoom,
      String inviteMore,
      String draft) async {
    try {
      await userRepo.createInvitationProduct(
          id,
          name,
          date,
          time,
          timeZone,
          hostedBy,
          location,
          phone,
          message,
          typeEvents,
          dressCode,
          food,
          addInfo,
          addAdmin,
          addChatRoom,
          inviteMore,
          draft);
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  getData() async {
    await viewData();
    await categoriesData();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
