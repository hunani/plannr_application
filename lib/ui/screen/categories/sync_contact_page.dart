import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';

import '../../../const/app_icon.dart';

class SyncContactPage extends StatelessWidget {
  static const String routeName = '/syncContactPage';
  const SyncContactPage({Key? key}) : super(key: key);

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
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(AppAssets.back, height: 55)),
                  Spacer(),
                  Text(
                    "Add Guest",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.share_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.kIndigo),
              child: Center(
                child: Text(
                  "SYNC Contact",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Keep your contacts synced with google \ncontacts so you never lose them",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
            ),
            SizedBox(height: 60),
            Container(
              height: 45,
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.kIndigo),
              child: Center(
                child: Text(
                  "Contact",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
