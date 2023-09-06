import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/ui/screen/events/events_overview.dart';
import '../../../core/utils/base_response.dart';
import 'controller/upcoming_controller.dart';
import 'create_invitation_screen.dart';

class EventsScreen extends StatefulWidget {
  static const String routeName = '/eventsScreen';
  const EventsScreen({Key? key}) : super(key: key);

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<String> list = ["Upcoming", "Past"];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  list.length,
                  (index) => GestureDetector(
                    onTap: () {
                      selectIndex = index;
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 10, left: 10),
                      height: 45,
                      width: 160,
                      decoration: BoxDecoration(
                        color:
                            selectIndex == index ? Colors.black : Colors.white,
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          list[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: selectIndex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Expanded(
              child: IndexedStack(
                index: selectIndex,
                children: [
                  Upcoming(),
                  Past(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (UpcomingController controller) {
        if (controller.isLoading) {
          return Container();
        }
        return RefreshIndicator(
          onRefresh: () async {
            controller.upcomingData();
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: controller.upcomingDataList.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(height: 20),
                        ...List.generate(
                          controller.upcomingDataList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              if (controller.upcomingDataList[index].draft !=
                                  "Continue") {
                                Get.toNamed(EventOverviewScreen.routeName,
                                    arguments:
                                        controller.upcomingDataList[index].id);
                              } else {
                                draftShareBottomSheet(
                                    controller.upcomingDataList[index].id);
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                              controller.upcomingDataList[index]
                                                  .image,
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      controller.upcomingDataList[index]
                                                  .draft ==
                                              "Continue"
                                          ? Positioned(
                                              left: 0,
                                              right: 0,
                                              child:
                                                  Image.asset(AppAssets.draft))
                                          : Container(),
                                    ],
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.upcomingDataList[index].name,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${controller.upcomingDataList[index].date}    ${controller.upcomingDataList[index].time}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Hosted By : ${controller.upcomingDataList[index].hostedBy}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 210),
                      child: Center(
                          child: Text(
                        "No Data",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w800),
                      )),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class Past extends StatelessWidget {
  const Past({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (UpcomingController controller) {
        if (controller.isLoading) {
          return Container();
        }
        return RefreshIndicator(
          onRefresh: () async {
            controller.pastData();
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: controller.pastDataList.isNotEmpty
                  ? Column(
                      children: [
                        SizedBox(height: 20),
                        ...List.generate(
                          controller.pastDataList.length,
                          (index) => GestureDetector(
                            onTap: () {
                              Get.toNamed(EventOverviewScreen.routeName,
                                  arguments: controller.pastDataList[index].id);
                              print(
                                  "====id======>${controller.pastDataList[index].id}");
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                          controller.pastDataList[index].image,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.pastDataList[index].name,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "${controller.pastDataList[index].date}    ${controller.pastDataList[index].time}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        "Hosted By : ${controller.pastDataList[index].hostedBy}",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 210),
                      child: Center(
                          child: Text(
                        "No Data",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w800),
                      )),
                    ),
            ),
          ),
        );
      },
    );
  }
}

void draftShareBottomSheet(int upcomingId) async {
  Get.bottomSheet(
    DraftShareBottomSheet(id: upcomingId),
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

class DraftShareBottomSheet extends StatelessWidget {
  final int id;
  const DraftShareBottomSheet({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (UpcomingController controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            GestureDetector(
              onTap: () async {
                Get.toNamed(EventsCreateScreen.routeName, arguments: id);
                // EasyLoading.show();
                // final response = await controller.draftDelete(id);
                // EasyLoading.dismiss();
                // response.when(
                //   success: (data) {
                //
                //   },
                //   failure: (ErrorType type, String? message) {
                //     Fluttertoast.showToast(
                //       msg: message!,
                //       gravity: ToastGravity.CENTER,
                //       textColor: Colors.red,
                //       backgroundColor: Colors.black38,
                //     );
                //   },
                // );
              },
              child: Container(
                height: 40,
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    "Continue Draft",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Divider(thickness: 1.5),
            GestureDetector(
              onTap: () async {
                EasyLoading.show();
                final response = await controller.draftDelete(id);
                EasyLoading.dismiss();
                response.when(
                  success: (data) {
                    Get.back();
                    controller.upcomingData();
                    Fluttertoast.showToast(
                      msg: "Event Cancel",
                      gravity: ToastGravity.CENTER,
                      textColor: Colors.red,
                      backgroundColor: Colors.black38,
                    );
                  },
                  failure: (ErrorType type, String? message) {
                    Fluttertoast.showToast(
                      msg: message!,
                      gravity: ToastGravity.CENTER,
                      textColor: Colors.red,
                      backgroundColor: Colors.black38,
                    );
                  },
                );
              },
              child: Container(
                height: 40,
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    "Delete Draft",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Divider(thickness: 1.5),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                height: 40,
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
