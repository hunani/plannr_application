import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/dashboad/dashboad_screen.dart';
import 'package:plannr_app/ui/screen/login/widget/bottom_sheet.dart';

import '../../../const/app_icon.dart';

class PropertiesScreen extends StatefulWidget {
  static const String routeName = '/propertiesScreen';
  const PropertiesScreen({Key? key}) : super(key: key);

  @override
  State<PropertiesScreen> createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  bool view = false;
  bool view2 = false;
  bool view3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                    height: 100,
                    width: 200,
                    color: Colors.transparent,
                    child: Center(
                        child: Image.asset(
                      AppAssets.appNameImage,
                      fit: BoxFit.cover,
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Image.asset(
                      AppAssets.remove,
                      height: 20,
                      color: Colors.transparent,
                    ),
                    Spacer(),
                    Text(
                      "UPGRADE NOW",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                    Spacer(),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(AppAssets.remove, height: 20)),
                  ],
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  //Get.toNamed(DashboadScreen.routeName);
                  paymentBottomSheet();
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Free",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                view = !view;
                                setState(() {});
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: view == true
                                      ? AppColor.kIndigo
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: view == true
                                          ? AppColor.kIndigo
                                          : AppColor.kIndigo),
                                ),
                                child: view == true
                                    ? Center(
                                        child: Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      ))
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "\$0.00",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: AppColor.kIndigo,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AppAssets.file1, height: 10),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "15 people max per event",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: AppColor.kIndigo,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(AppAssets.file2, height: 10),
                              ),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Unlimited event creation",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Paid options:",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(Icons.check_box_outline_blank_sharp, size: 18),
                            SizedBox(width: 10),
                            Text(
                              "Add chatroom (\$2.99 per event)",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.check_box_outline_blank_sharp, size: 18),
                            SizedBox(width: 10),
                            Text(
                              "Add up to 25 guests (\$2.99 per event)",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Basic",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              view2 = !view2;
                              setState(() {});
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: view2 == true
                                    ? AppColor.kIndigo
                                    : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: view2 == true
                                        ? AppColor.kIndigo
                                        : AppColor.kIndigo),
                              ),
                              child: view2 == true
                                  ? Center(
                                      child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ))
                                  : Container(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "\$4.99/month",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.kIndigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.file1, height: 10),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "25 people max per event",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.kIndigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.file2, height: 10),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Unlimited event creationn",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.kIndigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.file3, height: 10),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Access to all current available templates",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Paid options:",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Icon(Icons.check_box_outline_blank_sharp, size: 18),
                          SizedBox(width: 10),
                          Text(
                            "Add chatroom (\$2.99 per event)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.check_box_outline_blank_sharp, size: 18),
                          SizedBox(width: 10),
                          Text(
                            "Add up to 25 guests (\$2.99 per event)",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Premium",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              view3 = !view3;
                              setState(() {});
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: view3 == true
                                    ? AppColor.kIndigo
                                    : Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: view3 == true
                                        ? AppColor.kIndigo
                                        : AppColor.kIndigo),
                              ),
                              child: view3 == true
                                  ? Center(
                                      child: Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    ))
                                  : Container(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "\$15.99/month – \$159.99/year",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.kIndigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.file1, height: 10),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Up to 1500 people per event",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.kIndigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.file2, height: 10),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Unlimited event creation",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.kIndigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.file3, height: 10),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Access to all current available templates",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: AppColor.kIndigo,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(AppAssets.file4, height: 10),
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Chatrooms for all events",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
