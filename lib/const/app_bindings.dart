import 'package:get/get.dart';
import '../ui/screen/categories/controller/cart_controller.dart';
import '../ui/screen/categories/controller/categories_controller.dart';
import '../ui/screen/forget/controller/forgot_controller.dart';
import '../ui/screen/home/controller/home_controller.dart';
import '../ui/screen/login/controller/login_controller.dart';
import '../ui/screen/sign_up/controller/register_controller.dart';
import '../widget/app_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController(), fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(), fenix: true);
    Get.lazyPut<ForgotController>(() => ForgotController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<CategoriesController>(() => CategoriesController(),
        fenix: true);
    Get.lazyPut<CartController>(() => CartController(), fenix: true);
  }
}
