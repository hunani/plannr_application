import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:plannr_app/route/route_generator.dart';
import 'package:plannr_app/widget/app_controller.dart';
import 'package:plannr_app/widget/app_prefs.dart';
import 'package:plannr_app/widget/global.dart';
import 'const/app_bindings.dart';
import 'core/network/api_client.dart';
import 'core/network/dio/dio_api_client.dart';
import 'core/repository/user_repository.dart';
import 'core/repository/user_repository_impl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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


