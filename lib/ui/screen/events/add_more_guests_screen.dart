import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/ui/screen/events/controller/add_guests_controller.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class AddMoreGuestsScreen extends StatefulWidget {
  static const String routeName = '/addMoreGuestsScreen';
  const AddMoreGuestsScreen({Key? key}) : super(key: key);

  @override
  State<AddMoreGuestsScreen> createState() => _AddMoreGuestsScreenState();
}

class _AddMoreGuestsScreenState extends State<AddMoreGuestsScreen> {
  int? view;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: GetBuilder(
        builder: (AddGuestsController controller) {
          return SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
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
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Add more guests",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22),
                        ),
                      ),
                      SizedBox(height: 30),
                      ...List.generate(
                        controller.addGustsDataList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20, right: 15, left: 15),
                          child: Container(
                            height: 60,
                            color: Colors.white,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Center(
                                        child: Image.asset(AppAssets.addGuest),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          controller
                                              .addGustsDataList[index].name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600)),
                                      SizedBox(height: 5),
                                      Text(
                                          controller.addGustsDataList[index]
                                              .mobileNumber,
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        color: controller
                                                    .addGustsDataList[index]
                                                    .select ==
                                                "true"
                                            ? Colors.black
                                            : Colors.white,
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: controller.addGustsDataList[index]
                                                  .select ==
                                              "true"
                                          ? Icon(Icons.done,
                                              size: 19, color: Colors.white)
                                          : Container(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.addGustsDataList.isNotEmpty
                    ? Positioned(
                        bottom: 10,
                        left: 15,
                        right: 15,
                        child: GestureDetector(
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            Center(
                                              child: Text(
                                                "Guests Added!",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 22),
                                              ),
                                            ),
                                            SizedBox(height: 15),
                                            Center(
                                              child: Text(
                                                "Your guests have been added. If you want to add more than your current limit, you can adjust your plan under your profile",
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
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Center(
                                                      child: Text(
                                                    "ok",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff012130),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                "Add guests",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
      ),
    );
  }
}
