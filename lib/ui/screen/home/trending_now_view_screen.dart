import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import 'controller/home_controller.dart';

class TrendingNowViewScreen extends StatelessWidget {
  static const String routeName = '/trendingNowViewScreen';
  const TrendingNowViewScreen({Key? key}) : super(key: key);

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
                          "Trending Now View",
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
                    controller.trendingBannerDataList.length,
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
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                        controller.trendingBannerDataList[index]
                                            .imagePath,
                                        fit: BoxFit.cover)),
                              ),
                              SizedBox(height: 7),
                              Center(
                                child: Text(
                                  controller
                                      .trendingBannerDataList[index].title,
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
