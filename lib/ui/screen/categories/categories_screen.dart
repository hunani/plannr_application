import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';

import '../../../const/app_icon.dart';
import 'card_screen.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categoriesScreen';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 4),
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
                        contentPadding:
                            const EdgeInsets.only(top: 20, left: 15),
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
                ...List.generate(
                    10,
                    (index) => Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(CardScreen.routeName);
                              },
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 10, top: 10),
                                      child: Container(
                                        height: 65,
                                        width: 65,
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                              AppAssets.homeImage2,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 15),
                                    Text(
                                      "Birthday Party",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17),
                                    ),
                                    Spacer(),
                                    Icon(Icons.add, size: 30),
                                  ],
                                ),
                              ),
                            ),
                            Divider(thickness: 1.5),
                          ],
                        )),
                SizedBox(height: 35),
                Image.asset(AppAssets.homeImage4),
                SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
