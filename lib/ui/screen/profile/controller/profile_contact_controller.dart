import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/widget/global.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../../categories/model/contact_model.dart';
import '../../categories/model/create_list_model.dart';

class ProfileContactController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  UiFailure? uiFailure;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  List<CreateDataList> createListDataList = [];
  Future<UiResult<bool>> createListData() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response =
          await userRepo.createList(appController.loginModel!.userId);
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

  Future<UiResult<bool>> createContact(
      String name, String email, String number) async {
    try {
      await userRepo.createContact(
          appController.loginModel!.userId, name, email, number);
      print("==>${appController.loginModel!.userId}");
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  Future<UiResult<bool>> sendContacts(
      List<ContactsListNameAndNumber> list) async {
    try {
      await userRepo.contactSubmit(appController.loginModel!.userId, list);
      print("list =========> ${list.length}");
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  @override
  void onInit() {
    // createListData();
    super.onInit();
  }
}