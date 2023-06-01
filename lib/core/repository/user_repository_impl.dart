import 'package:get_it/get_it.dart';
import 'package:plannr_app/ui/screen/login/mode/login_model.dart';
import '../../ui/screen/categories/model/cart_model.dart';
import '../../ui/screen/categories/model/color_model.dart';
import '../../ui/screen/categories/model/fitter_model.dart';
import '../../ui/screen/home/model/banner_model.dart';
import '../../ui/screen/home/model/categories_model.dart';
import '../../ui/screen/sign_up/model/signup_model.dart';
import '../network/api_client.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final repo = GetIt.I.get<ApiClient>();

  @override
  Future<LoginModel> login(String email, String password) async {
    return await repo.login(email, password);
  }

  @override
  Future<void> register(String firstName, String lastName, String phone,
      String email, String password, String rePassword) async {
    return await repo.register(
        firstName, lastName, phone, email, password, rePassword);
  }

  @override
  Future<void> otpVerification(String email, String otp) async {
    return await repo.otpVerification(email, otp);
  }

  @override
  Future<void> forgotPassword(String email) async {
    return await repo.forgotPassword(email);
  }

  @override
  Future<void> resetPassword(
      String email, String password, String rPassword) async {
    return await repo.resetPassword(email, password, rPassword);
  }

  @override
  Future<List<CategoriesList>> categories() async {
    return await repo.categories();
  }

  @override
  Future<List<BannerList>> banner() async {
    return await repo.banner();
  }

  @override
  Future<List<CartList>> cartData() async {
    return await repo.cartData();
  }

  @override
  Future<List<ColorList>> colorData() async {
    return await repo.colorData();
  }

  @override
  Future<List<FitterDataList>> fitter(String premium, String colorId) async {
    return await repo.fitter(premium, colorId);
  }
}
