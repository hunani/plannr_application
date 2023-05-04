import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/select_filter.dart';

import '../../../const/app_icon.dart';
import 'create_invitation_screen.dart';

class CardScreen extends StatefulWidget {
  static const String routeName = '/cardScreen';
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(),
      backgroundColor: AppColor.kScreenColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.4), blurRadius: 4),
                    ]),
                child: TextFormField(
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  validator: (val) =>
                      val!.trim().isEmpty ? "field required" : null,
                  decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.kIndigo)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColor.kIndigo)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColor.kIndigo),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(color: Colors.black38),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.only(top: 20, left: 15),
                      hintText: "Enter your city",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          AppAssets.searchImage,
                          height: 20,
                        ),
                      )),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Image.asset(
                      AppAssets.filters,
                      height: 30,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "100 items",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ...List.generate(
                6,
                (index) => GestureDetector(
                  onTap: () {
                    Get.toNamed(SelectFilter.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 4)
                          ]),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 5, right: 5, top: 5),
                            child: Container(
                              height: 220,
                              child: Image.asset(AppAssets.happy3,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppAssets.hero, height: 14),
                              SizedBox(width: 10),
                              Text(
                                "Premium Invitation",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Princess Olivia 1st Birthday",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget? drawer() {
    return Container(
      width: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.4), blurRadius: 3)
                      ],
                      color: AppColor.kScreenColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Text(
                  "Filter",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              height: 100,
              width: 240,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4), blurRadius: 4)
                  ]),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                          size: 27,
                          color: Colors.black38,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Free",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Divider(thickness: 1.5),
                    Row(
                      children: [
                        Icon(
                          Icons.check_box_outline_blank,
                          size: 27,
                          color: Colors.black38,
                        ),
                        SizedBox(width: 15),
                        Text(
                          "Premium",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              AppAssets.colorImage,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Container(
              height: 50,
              width: 240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.kIndigo,
              ),
              child: Center(
                child: Text(
                  "Apply",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 47,
              width: 240,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.kIndigo),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  "Clear",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
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
