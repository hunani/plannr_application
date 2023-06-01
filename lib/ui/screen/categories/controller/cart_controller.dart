import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/categories/model/cart_model.dart';
import 'package:plannr_app/ui/screen/categories/model/color_model.dart';
import 'package:plannr_app/ui/screen/home/model/categories_model.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../model/fitter_model.dart';

class CartController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  UiFailure? uiFailure;

  List<CartList> cartDataList = [];
  Future<UiResult<bool>> cart() async {
    try {
      EasyLoading.show();
      final response = await userRepo.cartData();
      cartDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      EasyLoading.dismiss();
      update();
    }
  }

  List<ColorList> colorDataList = [];
  int? selectIndex;
  int? id;
  Future<UiResult<bool>> color() async {
    try {
      EasyLoading.show();
      final response = await userRepo.colorData();
      colorDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      EasyLoading.dismiss();
      update();
    }
  }

  List<String> list = ["Free", "Premium"];
  int? fillIndex;
  List<FitterDataList> fitterList = [];
  Future<UiResult<bool>> fitter(String premium, String colorId) async {
    try {
      final response = await userRepo.fitter(premium, colorId);
      fitterList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    }
  }

  @override
  void onInit() {
    cart();
    color();
    super.onInit();
  }
}
