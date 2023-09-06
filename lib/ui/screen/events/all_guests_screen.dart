import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';

import '../../../const/app_icon.dart';

class AllGuestsScreen extends StatelessWidget {
  static const String routeName = '/allGuestsScreen';
  const AllGuestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(AppAssets.back, height: 55)),
                Spacer(),
                Center(
                    child: Image.asset(
                  AppAssets.appNameImage,
                  fit: BoxFit.cover,
                  height: 70,
                )),
                Spacer(),
                GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AppAssets.back,
                      height: 55,
                      color: Colors.transparent,
                    )),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                "All Guests",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                height: 60,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset(AppAssets.profile, height: 48),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Abel Smith",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600)),
                          SizedBox(height: 5),
                          Text("784-717-2 944",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Spacer(),
                      Text("Yes",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    "Are you sure?",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Center(
                                  child: Text(
                                    "The guest will be notified of their removal from the event. However, You will be able to re-add this guest.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Center(
                                    child: Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: AppColor.kIndigo,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                          child: Text(
                                        "remove",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xff012130),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    "Remove Guest",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
