import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:plannr_app/route/route_generator.dart';
import 'package:plannr_app/ui/screen/splash/splash_screen.dart';
import 'const/app_bindings.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Nunito",
      ),
      initialBinding: AppBindings(),
      initialRoute: SplashScreen.routeName,
      debugShowCheckedModeBanner: false,
      getPages: routes,
    );
  }
}
