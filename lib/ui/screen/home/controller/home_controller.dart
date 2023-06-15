import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/home/model/banner_model.dart';
import 'package:plannr_app/ui/screen/home/model/birtday_party_model.dart';
import 'package:plannr_app/ui/screen/home/model/categories_model.dart';
import '../../../../core/repository/user_repository.dart';
import '../../../../core/ui_failure/ui_result.dart';
import '../../../../core/utils/error_util.dart';
import '../model/bridal_shower_model.dart';
import '../model/trending_model.dart';

class HomeController extends GetxController {
  final userRepo = GetIt.I.get<UserRepository>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UiFailure? uiFailure;

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

  List<BannerList> bannerDataList = [];
  Future<UiResult<bool>> bannerData() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.banner();
      bannerDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  List<BirtdayPartyList> birtdayPartyDataList = [];
  Future<UiResult<bool>> birtdayPartyData() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.birtdayParty();
      birtdayPartyDataList = response;
      return const UiSuccess(true);
    } catch (error, stackTrace) {
      return ErrorUtil.getUiFailureFromException(error, stackTrace);
    } finally {
      isLoading = false;
      EasyLoading.dismiss();
      update();
    }
  }

  List<TrendingBannerList> trendingBannerDataList = [];
  Future<UiResult<bool>> trendingBanner() async {
    try {
      isLoading = true;
      EasyLoading.show();
      final response = await userRepo.trendingBanner();
      trendingBannerDataList = response;
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
    categoriesData();
    bannerData();
    birtdayPartyData();
    trendingBanner();
    super.onInit();
  }
}
