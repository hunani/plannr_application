import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/core/utils/flitter_toast.dart';
import 'package:plannr_app/ui/screen/events/preview_screen.dart';
import 'package:plannr_app/ui/screen/events/send_chat_screen.dart';
import 'package:plannr_app/ui/screen/events/widget/bottom_sheet.dart';
import 'package:plannr_app/widget/global.dart';
import '../../../const/app_icon.dart';
import '../../../core/utils/base_response.dart';
import '../categories/add_guest_screen.dart';
import '../categories/widget/bottom_sheet.dart';
import '../dashboad/dashboad_screen.dart';
import 'event_cancel_screen.dart';
import 'gues_list.dart';
import 'gues_messages_screen.dart';
import 'preview_details_screen.dart';
import 'controller/edit_overview_controller.dart';
import 'create_invitation_screen.dart';
import 'messages_screen.dart';

class EventOverviewScreen extends StatefulWidget {
  static const String routeName = '/eventOverviewScreen';
  const EventOverviewScreen({Key? key}) : super(key: key);

  @override
  State<EventOverviewScreen> createState() => _EventOverviewScreenState();
}

class _EventOverviewScreenState extends State<EventOverviewScreen> {
  int selectIndex = 0;
  List<String> list = [
    "Edit Invitation",
    "View Invitation",
    "Cancel Event",
    "Chat Room",
  ];
  List<BottomTabModel> countList = [
    BottomTabModel("", "Attending"),
    BottomTabModel("", "Not Attending"),
    BottomTabModel("", "Pending"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: GetBuilder(
        builder: (EditOverviewController controller) {
          if (controller.isLoading) {
            return Container();
          }
          return RefreshIndicator(
            onRefresh: () async {
              controller.eventOverviewData(Get.arguments);
              controller.rsvpCountData(Get.arguments);
            },
            child: SafeArea(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: const EdgeInsets.only(right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Image.asset(AppAssets.back, height: 55)),
                            Text(
                              "Event Overview",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            ),
                            GestureDetector(
                                onTap: () {
                                  bottomSheet();
                                  //shareBottomSheet();
                                },
                                child: Image.asset(AppAssets.send, height: 25)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(PreviewDataScreen.routeName);
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
                                      controller.eventOverviewDataList[0].image,
                                      fit: BoxFit.cover),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.eventOverviewDataList[0].name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${controller.eventOverviewDataList[0].date}    ${controller.eventOverviewDataList[0].time}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Hosted By : ${controller.eventOverviewDataList[0].hostedBy}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AlignedGridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                selectIndex = index;
                                setState(() {});

                                if (selectIndex == 0) {
                                  Get.toNamed(EventsCreateScreen.routeName,
                                      arguments: controller
                                          .eventOverviewDataList[0].id);
                                }
                                if (selectIndex == 1) {
                                  Get.toNamed(PreviewScreen.routeName,
                                      arguments: controller
                                          .eventOverviewDataList[0].id);
                                }
                                if (selectIndex == 2) {
                                  int id = Get.arguments;
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          actions: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Center(
                                                    child: Text(
                                                      "Are you sure you would like to cancel?",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () async {
                                                          EasyLoading.show();
                                                          final response = await controller
                                                              .cancelEventData(
                                                                  appController
                                                                      .loginModel!
                                                                      .userId,
                                                                  id,
                                                                  "cancel");
                                                          EasyLoading.dismiss();
                                                          response.when(
                                                            success: (data) {
                                                              Get.toNamed(
                                                                  EventCancelScreen
                                                                      .routeName);
                                                            },
                                                            failure: (ErrorType
                                                                    type,
                                                                String?
                                                                    message) {
                                                              Fluttertoast
                                                                  .showToast(
                                                                msg: message!,
                                                                gravity:
                                                                    ToastGravity
                                                                        .CENTER,
                                                                textColor:
                                                                    Colors.red,
                                                                backgroundColor:
                                                                    Colors
                                                                        .black38,
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Center(
                                                          child: Container(
                                                            height: 35,
                                                            width: 90,
                                                            decoration: BoxDecoration(
                                                                color: AppColor
                                                                    .kIndigo,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                                child: Text(
                                                              "Confirm",
                                                              style: TextStyle(
                                                                  fontSize: 17,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 20),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Center(
                                                          child: Container(
                                                            height: 35,
                                                            width: 90,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                border: Border.all(
                                                                    color: AppColor
                                                                        .kIndigo),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5)),
                                                            child: Center(
                                                                child: Text(
                                                              "cancel",
                                                              style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            )),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                }
                                if (selectIndex == 3) {
                                  Get.toNamed(SendChatScreen.routeName);
                                }
                                // if (selectIndex == 3) {
                                //   showDialog(
                                //       context: context,
                                //       builder: (BuildContext context) {
                                //         return AlertDialog(
                                //           shape: RoundedRectangleBorder(
                                //             borderRadius:
                                //                 BorderRadius.circular(20),
                                //           ),
                                //           actions: [
                                //             Padding(
                                //               padding: const EdgeInsets.symmetric(
                                //                   horizontal: 30),
                                //               child: Column(
                                //                 crossAxisAlignment:
                                //                     CrossAxisAlignment.start,
                                //                 children: [
                                //                   SizedBox(height: 10),
                                //                   Center(
                                //                     child: Text(
                                //                       "Card Link Copied!  ",
                                //                       style: TextStyle(
                                //                           fontWeight:
                                //                               FontWeight.w600,
                                //                           fontSize: 22),
                                //                     ),
                                //                   ),
                                //                   SizedBox(height: 15),
                                //                   Center(
                                //                     child: Text(
                                //                       "Now you can paste your digital business card link whrever you’d like to share it",
                                //                       textAlign: TextAlign.center,
                                //                       style: TextStyle(
                                //                           fontWeight:
                                //                               FontWeight.w400,
                                //                           fontSize: 18),
                                //                     ),
                                //                   ),
                                //                   SizedBox(height: 20),
                                //                   GestureDetector(
                                //                     onTap: () {
                                //                       Get.back();
                                //                     },
                                //                     child: Center(
                                //                       child: Container(
                                //                         height: 35,
                                //                         width: 60,
                                //                         decoration: BoxDecoration(
                                //                             color:
                                //                                 AppColor.kIndigo,
                                //                             borderRadius:
                                //                                 BorderRadius
                                //                                     .circular(
                                //                                         10)),
                                //                         child: Center(
                                //                             child: Text(
                                //                           "ok",
                                //                           style: TextStyle(
                                //                               fontSize: 20,
                                //                               fontWeight:
                                //                                   FontWeight.w500,
                                //                               color:
                                //                                   Colors.white),
                                //                         )),
                                //                       ),
                                //                     ),
                                //                   ),
                                //                   SizedBox(height: 10),
                                //                 ],
                                //               ),
                                //             ),
                                //           ],
                                //         );
                                //       });
                                // }
                                // if (selectIndex == 4) {
                                //   Get.toNamed(AddGuestScreen.routeName,
                                //       arguments:
                                //           controller.eventOverviewDataList[0].id);
                                // }
                                // if (selectIndex == 5) {
                                //   Get.toNamed(MessagesScreen.routeName);
                                // }
                              },
                              child: Container(
                                height: 40,
                                width: 140,
                                decoration: BoxDecoration(
                                  color: selectIndex == index
                                      ? Colors.black
                                      : Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    list[index],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: selectIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      SizedBox(height: 30),
                      // Row(
                      //   children: [
                      //     Text(
                      //       "RSVP Count",
                      //       style: TextStyle(
                      //         fontSize: 17,
                      //         fontWeight: FontWeight.w600,
                      //       ),
                      //     ),
                      //     Spacer(),
                      //     Image.asset(AppAssets.user, height: 19),
                      //     SizedBox(width: 20),
                      //     Image.asset(AppAssets.image, height: 19),
                      //   ],
                      // ),
                      Text(
                        "RSVP Count",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    controller.rsvpCountDataList[0].attending
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Attending",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    controller.rsvpCountDataList[0].notAttending
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "Not Attending",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Container(
                              height: 100,
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    controller.rsvpCountDataList[0].attending
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "panding",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       height: 100,
                      //       width: 120,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black),
                      //         color: Colors.white,
                      //       ),
                      //       child: Column(
                      //         children: [
                      //           SizedBox(height: 20),
                      //           Text(
                      //             "Attending",
                      //             style: TextStyle(
                      //               fontSize: 30,
                      //               fontWeight: FontWeight.w800,
                      //             ),
                      //           ),
                      //           SizedBox(height: 5),
                      //           Text(
                      //             controller.rsvpCountDataList[0].attending
                      //                 .toString(),
                      //             style: TextStyle(
                      //               fontSize: 15,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     Container(
                      //       height: 100,
                      //       width: 120,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black),
                      //         color: Colors.white,
                      //       ),
                      //       child: Column(
                      //         children: [
                      //           SizedBox(height: 20),
                      //           Text(
                      //             "Not Attending",
                      //             style: TextStyle(
                      //               fontSize: 30,
                      //               fontWeight: FontWeight.w800,
                      //             ),
                      //           ),
                      //           SizedBox(height: 5),
                      //           Text(
                      //             controller.rsvpCountDataList[0].notAttending
                      //                 .toString(),
                      //             style: TextStyle(
                      //               fontSize: 15,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //     Container(
                      //       height: 100,
                      //       width: 120,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black),
                      //         color: Colors.white,
                      //       ),
                      //       child: Column(
                      //         children: [
                      //           SizedBox(height: 20),
                      //           Text(
                      //             "panding",
                      //             style: TextStyle(
                      //               fontSize: 30,
                      //               fontWeight: FontWeight.w800,
                      //             ),
                      //           ),
                      //           SizedBox(height: 5),
                      //           Text(
                      //             controller.rsvpCountDataList[0].attending
                      //                 .toString(),
                      //             style: TextStyle(
                      //               fontSize: 15,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(width: 10),
                      //   ],
                      // ),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(GuesMessagesScreen.routeName,
                              arguments:
                                  controller.eventOverviewDataList[0].id);
                          print(
                              "=====333=>${controller.eventOverviewDataList[0].id}");
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 4,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Manage Guest List",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
