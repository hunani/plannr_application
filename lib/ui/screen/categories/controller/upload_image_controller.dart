import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/home/model/categories_model.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';

class UploadImagesController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;

  File? _imagePath;

  File? get imagePath => _imagePath;

  set imagePath(File? value) {
    _imagePath = value;
    update();
  }

  bool _isLoading2 = false;

  bool get isLoading2 => _isLoading2;

  set isLoading2(bool value) {
    _isLoading2 = value;
    update();
  }

  Future<UiResult<bool>> createInvitation2(
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
      String inviteMore) async {
    try {
      await userRepo.createInvitationProduct2(
          imagePath!.path,
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
          inviteMore);
      return UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  List<CategoriesList> categoriesDataList = [];
  Future<UiResult<bool>> categoriesData() async {
    try {
      isLoading2 = true;
      update();
      EasyLoading.show();
      final response = await userRepo.categories();
      categoriesDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading2 = false;
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
