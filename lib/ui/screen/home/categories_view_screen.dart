import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/ui/screen/home/controller/home_controller.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';

class CategoriesViewScreen extends StatelessWidget {
  static const String routeName = '/categoriesViewScreen';
  const CategoriesViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: GetBuilder(
        builder: (HomeController controller) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
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
                  SizedBox(height: 10),
                  ...List.generate(
                    controller.categoriesDataList.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 250,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                        controller.categoriesDataList[index]
                                            .imagePath,
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(height: 7),
                              Center(
                                child: Text(
                                  controller.categoriesDataList[index].name,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
