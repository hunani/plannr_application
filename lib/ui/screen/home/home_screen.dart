import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/home/wigdet/carousel_withindicator.dart';

import '../../../const/app_icon.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
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
                  Image.asset(AppAssets.homeImage4),
                  SizedBox(height: 25),
                  CarouselWithIndicator(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  AlignedGridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color(0xffB3A1A1),
                            ),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                height: 100,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppAssets.homeImage2,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(
                                "Birthday Party",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      }),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Trending Now",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //margin: EdgeInsets.only(right: 15),
                              height: 250,
                              width: 330,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppAssets.happy,
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 7),
                            SizedBox(
                              width: 365,
                              child: Text(
                                "Plain Birthday Wallpapers - Wallpaper Cave",
                                maxLines: 2,
                                textAlign: TextAlign.start,
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
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "Engagement Party",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //margin: EdgeInsets.only(right: 15),
                              height: 250,
                              width: 330,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppAssets.happy2,
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 7),
                            SizedBox(
                              width: 365,
                              child: Text(
                                "Score Birthday Freebies With These Retailers",
                                maxLines: 2,
                                textAlign: TextAlign.start,
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
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "Bridal Shower",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 19),
                      ),
                      Spacer(),
                      Container(
                        height: 30,
                        width: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            "View More",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        5,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              //margin: EdgeInsets.only(right: 15),
                              height: 250,
                              width: 330,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(AppAssets.show,
                                      fit: BoxFit.cover)),
                            ),
                            SizedBox(height: 7),
                            SizedBox(
                              width: 365,
                              child: Text(
                                "Score Birthday Freebies With These Retailers",
                                maxLines: 2,
                                textAlign: TextAlign.start,
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
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
