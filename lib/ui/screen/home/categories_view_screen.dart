import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/ui/screen/home/controller/home_controller.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import '../categories/screen/view_categories_screen.dart';
import '../categories/screen/categories_screen.dart';
import '../categories/controller/categories_controller.dart';
import '../categories/screen/upload_screen.dart';

class CategoriesViewScreen extends StatelessWidget {
  static const String routeName = '/categoriesViewScreen';
  const CategoriesViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (CategoriesController controller) {
            if (controller.isLoading) {
              return Container();
            }
            return SafeArea(
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
                          Text(
                            "Categories View",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
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
                    ),
                    SizedBox(height: 20),
                    ...controller.categoriesDataList
                        .asMap()
                        .map((index, value) => MapEntry(
                            index,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                          ViewCategoriesScreen.routeName,
                                          arguments: CategoriesModel2(
                                              value.id, value.name));
                                    },
                                    child: Container(
                                      color: Colors.transparent,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10, top: 10),
                                            child: Container(
                                              height: 65,
                                              width: 65,
                                              decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                    value.imagePath,
                                                    fit: BoxFit.cover),
                                                // child: Image.asset(
                                                //     AppAssets.homeImage2,
                                                //     fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            value.name,
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
                                  Divider(thickness: 1, color: Colors.black38),
                                ],
                              ),
                            )))
                        .values
                        .toList(),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
