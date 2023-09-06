import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:plannr_app/route/route_generator.dart';
import 'package:plannr_app/widget/app_controller.dart';
import 'package:plannr_app/widget/app_prefs.dart';
import 'package:plannr_app/widget/global.dart';
import 'package:plannr_app/widget/image_picker.dart';
import 'const/app_bindings.dart';
import 'core/network/api_client.dart';
import 'core/network/dio/dio_api_client.dart';
import 'core/repository/user_repository.dart';
import 'core/repository/user_repository_impl.dart';

late final AppImagePicker appImagePicker;

void main() async {
  appImagePicker = AppImagePicker();
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51Nk4M8SJz8uuZyT3nU7RzVls7rhRlU5FjF0RPhNERrvfow5zcbOF0QG9z4jJS0UsjvrSry4Hcf92p1j4yXsCDIaQ00PJ89RjfU';
  // Stripe.merchantIdentifier = 'any string works';
  await Stripe.instance.applySettings();
  GetIt.I.registerSingletonAsync(() => AppPrefs.getInstance());
  GetIt.I.registerSingletonAsync<ApiClient>(() => DioApiClient.getInstance());
  GetIt.I.registerSingletonWithDependencies<UserRepository>(
    () => UserRepositoryImpl(),
    dependsOn: [ApiClient],
  );
  await GetIt.I.allReady();
  Get.put(AppController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayColor: Colors.black54,
      overlayWidget: Center(
        child: CircularProgressIndicator(
          strokeWidth: 4,
          color: Colors.blue,
        ),
      ),
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: "Nunito",
        ),
        initialBinding: AppBindings(),
        initialRoute: getInitialRoute,
        debugShowCheckedModeBanner: false,
        getPages: routes,
        builder: EasyLoading.init(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
