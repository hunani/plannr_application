import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/events/add_more_guests_screen.dart';
import 'package:plannr_app/ui/screen/events/controller/gues_List_controller.dart';

import '../../../const/app_icon.dart';
import 'all_guests_screen.dart';
import 'edit_contact_screen.dart';

class GuesListScreen extends StatefulWidget {
  static const String routeName = '/guesListScreen';
  const GuesListScreen({Key? key}) : super(key: key);

  @override
  State<GuesListScreen> createState() => _GuesListScreenState();
}

class _GuesListScreenState extends State<GuesListScreen> {
  List<String> list = ["All", "Yes", "Maybe", "No", "Pending"];
  int? selectIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: GetBuilder(
        builder: (GuestListController controller) {
          if (controller.isLoading) {
            return Container();
          }
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
                      Center(
                        child: Text(
                          "Guestlist",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black,
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          margin: EdgeInsets.only(right: 10),
                                          child: Text(value,
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    )
                                    .values
                                    .toList(),
                              ),
                            ),
                            SizedBox(height: 20),
                            Container(
                              height: 40,
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
                                validator: (val) => val!.trim().isEmpty
                                    ? "field required"
                                    : null,
                                decoration: InputDecoration(
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: AppColor.kIndigo)),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: AppColor.kIndigo),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    hintStyle: TextStyle(color: Colors.black38),
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        top: 20, left: 15),
                                    hintText: "Search Guests",
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset(
                                        AppAssets.searchImage,
                                        height: 20,
                                        color: AppColor.kIndigo,
                                      ),
                                    )),
                              ),
                            ),
                            SizedBox(height: 30),
                            Column(
                              children: List.generate(
                                controller.createListDataList.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AllGuestsScreen.routeName);
                                    //shareBottomSheet2();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      height: 60,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          children: [
                                            Image.asset(AppAssets.profile,
                                                height: 48),
                                            SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    controller
                                                        .createListDataList[
                                                            index]
                                                        .name,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                                SizedBox(height: 5),
                                                Text(
                                                    controller
                                                        .createListDataList[
                                                            index]
                                                        .mobileNumber,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ],
                                            ),
                                            Spacer(),
                                            Text(
                                                controller
                                                    .createListDataList[index]
                                                    .status,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ],
                                        ),
                                      ),
                                    ),
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
                // Positioned(
                //   bottom: 15,
                //   left: 15,
                //   right: 15,
                //   child: GestureDetector(
                //     onTap: () {
                //       Get.toNamed(AddMoreGuestsScreen.routeName);
                //     },
                //     child: Container(
                //       height: 50,
                //       decoration: BoxDecoration(
                //         color: Color(0xff012130),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //       child: Center(
                //         child: Text(
                //           "Add more guests",
                //           style: TextStyle(fontSize: 20, color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.toNamed(AddMoreGuestsScreen.routeName, arguments: Get.arguments);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xff012130),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "Add more guests",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
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
