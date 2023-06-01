import 'package:plannr_app/ui/screen/login/mode/login_model.dart';

import '../../ui/screen/categories/model/cart_model.dart';
import '../../ui/screen/categories/model/color_model.dart';
import '../../ui/screen/categories/model/fitter_model.dart';
import '../../ui/screen/home/model/banner_model.dart';
import '../../ui/screen/home/model/categories_model.dart';
import '../../ui/screen/sign_up/model/signup_model.dart';

abstract class UserRepository {
  Future<LoginModel> login(String email, String password);

  Future<void> register(String firstName, String lastName, String phone,
      String email, String password, String rePassword);

  Future<void> otpVerification(String email, String otp);

  Future<void> forgotPassword(String email);

  Future<void> resetPassword(String email, String password, String rPassword);

  Future<List<CategoriesList>> categories();

  Future<List<BannerList>> banner();

  Future<List<CartList>> cartData();

  Future<List<ColorList>> colorData();

  Future<List<FitterDataList>> fitter(String premium, String colorId);
}
