import 'package:get/get.dart';
import '../ui/screen/categories/controller/cart_controller.dart';
import '../ui/screen/categories/controller/categories_controller.dart';
import '../ui/screen/categories/controller/create_contact_controller.dart';
import '../ui/screen/categories/controller/create_controller.dart';
import '../ui/screen/categories/controller/create_list_controller.dart';
import '../ui/screen/categories/controller/upload_controller.dart';
import '../ui/screen/categories/controller/upload_image_controller.dart';
import '../ui/screen/events/controller/edit_overview_controller.dart';
import '../ui/screen/events/controller/view_invatation_controller.dart';
import '../ui/screen/events/controller/upcoming_controller.dart';
import '../ui/screen/forget/controller/forgot_controller.dart';
import '../ui/screen/home/controller/home_controller.dart';
import '../ui/screen/login/controller/login_controller.dart';
import '../ui/screen/sign_up/controller/register_controller.dart';
import '../widget/app_controller.dart';
import '../widget/image_picker.dart';

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
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
    Get.lazyPut<UploadController>(() => UploadController(), fenix: true);
    Get.lazyPut<UpcomingController>(() => UpcomingController(), fenix: true);
    Get.lazyPut<EditOverviewController>(() => EditOverviewController(),
        fenix: true);
    Get.lazyPut<EventsCreateController>(() => EventsCreateController(),
        fenix: true);
    Get.lazyPut<CreateContactDataController>(
        () => CreateContactDataController(),
        fenix: true);
    Get.lazyPut<CreateContactController>(() => CreateContactController(),
        fenix: true);
    Get.lazyPut<ImagePickerController>(() => ImagePickerController(),
        fenix: true);
    Get.lazyPut<UploadImagesController>(() => UploadImagesController(),
        fenix: true);
  }
}
