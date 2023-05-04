import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';

import '../../../const/app_icon.dart';
import 'edit_contact_screen.dart';

class GuesListScreen extends StatefulWidget {
  static const String routeName = '/guesListScreen';
  const GuesListScreen({Key? key}) : super(key: key);

  @override
  State<GuesListScreen> createState() => _GuesListScreenState();
}

class _GuesListScreenState extends State<GuesListScreen> {
  List<String> list = [
    "All(1)",
    "Yes(1)",
    "Maybe(0)",
    "No(1)",
    "Not at",
    "All(1)",
    "Yes(1)"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                    Spacer(),
                    Text(
                      "Guestlist",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    Spacer(),
                    Image.asset(AppAssets.userImage3, height: 18),
                    SizedBox(width: 15),
                    Image.asset(AppAssets.gues, height: 20),
                    SizedBox(width: 15),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      clipBehavior: Clip.none,
                      child: Row(
                        children: list
                            .asMap()
                            .map(
                              (index, value) => MapEntry(
                                index,
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.black,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(value,
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      ),
                    ),
                    SizedBox(height: 20),
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
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                        validator: (val) =>
                            val!.trim().isEmpty ? "field required" : null,
                        decoration: InputDecoration(
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: AppColor.kIndigo)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: AppColor.kIndigo)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.kIndigo),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintStyle: TextStyle(color: Colors.black38),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding:
                                const EdgeInsets.only(top: 20, left: 15),
                            hintText: "Search Guests",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Image.asset(
                                AppAssets.searchImage,
                                height: 20,
                                color: AppColor.kIndigo,
                              ),
                            )),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        shareBottomSheet2();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 4),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Text Text (Host)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "rayoter501@necktai.com",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                "1 Adult",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              Image.asset(AppAssets.menu, height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void shareBottomSheet2() async {
  Get.bottomSheet(
    const ShareBottomSheet2(),
    backgroundColor: Color(0xffE0E2EF),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
    ),
  );
}

class ShareBottomSheet2 extends StatelessWidget {
  const ShareBottomSheet2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "More Options",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(AppAssets.remove, height: 16)),
            ],
          ),
        ),
        Divider(thickness: 1.5),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            Get.toNamed(EditContactScreen.routeName);
          },
          child: Container(
            height: 40,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppAssets.edit, height: 16),
                  SizedBox(width: 15),
                  Text(
                    "Edit Contact",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
