import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';

import '../../../const/app_icon.dart';

class FaqScreen extends StatefulWidget {
  static const String routeName = '/faqScreen';
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool view = false;
  bool view2 = false;
  bool view3 = false;
  bool view4 = false;
  bool view5 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(AppAssets.back, height: 55)),
                  Text(
                    "Frequently Asked Questions",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        AppAssets.back,
                        height: 55,
                        color: Colors.transparent,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColor.kIndigo),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "omare laoreet mi tempus neque",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          view = !view;
                          setState(() {});
                        },
                        child: view == false
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_sharp,
                                size: 20,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              view == true
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Text(
                        "Timperdiet gravida scelerisque odio nunc. Eget felis, odio bibendum quis eget sit lorem donec diam. Volutpat sed orci turpis sit dolor est a pretium eget. Vitae turpis orci vel tellus cursus lorem vestibulum quis eu. Ut commodo, eget lorem venenatis urna.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    )
                  : Container(),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColor.kIndigo),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Rhoncus nullam aliquam nam proin",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          view2 = !view2;
                          setState(() {});
                        },
                        child: view == false
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_sharp,
                                size: 20,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              view2 == true
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Text(
                        "Timperdiet gravida scelerisque odio nunc. Eget felis, odio bibendum quis eget sit lorem donec diam. Volutpat sed orci turpis sit dolor est a pretium eget. Vitae turpis orci vel tellus cursus lorem vestibulum quis eu. Ut commodo, eget lorem venenatis urna.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    )
                  : Container(),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColor.kIndigo),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Duis enim bibendum dui ut fringilla suspendisse",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          view3 = !view3;
                          setState(() {});
                        },
                        child: view == false
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_sharp,
                                size: 20,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              view3 == true
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Text(
                        "Timperdiet gravida scelerisque odio nunc. Eget felis, odio bibendum quis eget sit lorem donec diam. Volutpat sed orci turpis sit dolor est a pretium eget. Vitae turpis orci vel tellus cursus lorem vestibulum quis eu. Ut commodo, eget lorem venenatis urna.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    )
                  : Container(),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColor.kIndigo),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Lectus fringilla volutpat egestas nisi, viverra mauris",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          view4 = !view4;
                          setState(() {});
                        },
                        child: view == false
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_sharp,
                                size: 20,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              view4 == true
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Text(
                        "Timperdiet gravida scelerisque odio nunc. Eget felis, odio bibendum quis eget sit lorem donec diam. Volutpat sed orci turpis sit dolor est a pretium eget. Vitae turpis orci vel tellus cursus lorem vestibulum quis eu. Ut commodo, eget lorem venenatis urna.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    )
                  : Container(),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColor.kIndigo),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Text(
                        "Vitae sollicitudin vitae libero tincidunt",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          view5 = !view5;
                          setState(() {});
                        },
                        child: view == false
                            ? Icon(
                                Icons.keyboard_arrow_down,
                                size: 20,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_sharp,
                                size: 20,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              view5 == true
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 20),
                      child: Text(
                        "Timperdiet gravida scelerisque odio nunc. Eget felis, odio bibendum quis eget sit lorem donec diam. Volutpat sed orci turpis sit dolor est a pretium eget. Vitae turpis orci vel tellus cursus lorem vestibulum quis eu. Ut commodo, eget lorem venenatis urna.",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 14),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
