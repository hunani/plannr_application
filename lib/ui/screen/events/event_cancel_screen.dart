import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/ui/screen/dashboad/dashboad_screen.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class EventCancelScreen extends StatelessWidget {
  static const String routeName = '/eventCancelScreen';
  const EventCancelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Center(
                  child: Image.asset(
                AppAssets.appNameImage,
                fit: BoxFit.cover,
                height: 70,
              )),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Your event has",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "been",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 30),
                      ),
                      SizedBox(width: 9),
                      Text(
                        "CANCELED.",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 31,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "All guests will be notified.",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(DashboadScreen.routeName);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xff012130),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Go to my Events",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
