import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import '../ui/screen/login/mode/login_model.dart';
import 'app_prefs.dart';

class AppController extends GetxController {
  LoginModel? loginModel;
  final appPref = GetIt.I.get<AppPrefs>();

  @override
  void onInit() {
    loginModel = appPref.getUser;
    super.onInit();
  }
}
