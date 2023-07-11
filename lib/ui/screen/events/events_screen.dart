import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/ui/screen/events/events_overview.dart';

import 'controller/upcoming_controller.dart';

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
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 20),
                ...List.generate(
                  controller.upcomingDataList.length,
                  (index) => GestureDetector(
                    onTap: () {
                      // if (index == 2) {
                      //   draftShareBottomSheet();
                      // } else {
                      Get.toNamed(EventOverviewScreen.routeName,
                          arguments: controller.upcomingDataList[index].id);
                      // }
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
                                  controller.upcomingDataList[index].image,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
          return Center(child: CircularProgressIndicator());
        }
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
          ),
        );
      },
    );
  }
}

void draftShareBottomSheet() async {
  Get.bottomSheet(
    const DraftShareBottomSheet(),
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
  const DraftShareBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Center(
          child: Text(
            "Continue Draft",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5),
        Divider(thickness: 1.5),
        SizedBox(height: 5),
        Center(
          child: Text(
            "Delete Draft",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 5),
        Divider(thickness: 1.5),
        SizedBox(height: 5),
        GestureDetector(
          onTap: () {
            Get.back();
          },
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
        SizedBox(height: 20),
      ],
    );
  }
}
