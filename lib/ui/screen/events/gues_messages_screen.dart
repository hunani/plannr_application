import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
import 'controller/guest_by_Rsvp_controller.dart';
import 'menu_screen.dart';
import 'messages_screen.dart';

class GuesMessagesScreen extends StatefulWidget {
  static const String routeName = '/guesMessagesScreen';
  const GuesMessagesScreen({Key? key}) : super(key: key);

  @override
  State<GuesMessagesScreen> createState() => _GuesMessagesScreenState();
}

class _GuesMessagesScreenState extends State<GuesMessagesScreen> {
  List<String> list = [
    "All(1)",
    "Yes(1)",
    "Maybe(0)",
    "No(1)",
    "Not at",
    "All(1)",
    "Yes(1)"
  ];

  List<GuesModel> allGuests = [
    GuesModel(all: "All Guests", guests: "Send message to all of your guests"),
    GuesModel(all: "Yes", guests: "Send message to all guests responding YES"),
    GuesModel(all: "No", guests: "Send message to all guests responding NO"),
    GuesModel(
        all: "Maybe", guests: "Send message to all guests responding MAYBE"),
    GuesModel(
        all: "Pending",
        guests: "Send message to all of who haven’t responded yet"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (GuestByRsvpController controller) {
            if (controller.isLoading) {
              return Container();
            }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
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
                      "Messages",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Message Guests By RSVP ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 20),
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
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(MenuScreen.routeName);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.black,
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        margin: EdgeInsets.only(right: 10),
                                        child: Text(value,
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                )
                                .values
                                .toList(),
                          ),
                        ),
                        SizedBox(height: 50),
                        // ...List.generate(
                        //   allGuests.length,
                        //   (index) => Padding(
                        //     padding: const EdgeInsets.only(bottom: 15),
                        //     child: GestureDetector(
                        //       onTap: () {
                        //         Get.toNamed(MessagesScreen.routeName);
                        //       },
                        //       child: Container(
                        //         width: double.infinity,
                        //         decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.circular(5),
                        //             boxShadow: [
                        //               BoxShadow(
                        //                   color: Colors.black.withOpacity(0.5),
                        //                   blurRadius: 5),
                        //             ]),
                        //         child: Padding(
                        //           padding: const EdgeInsets.symmetric(
                        //               horizontal: 15, vertical: 15),
                        //           child: Row(
                        //             children: [
                        //               Image.asset(AppAssets.icon, height: 40),
                        //               SizedBox(width: 13),
                        //               Column(
                        //                 crossAxisAlignment:
                        //                     CrossAxisAlignment.start,
                        //                 children: [
                        //                   Text(
                        //                     allGuests[index].all,
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w500,
                        //                       fontSize: 17,
                        //                     ),
                        //                   ),
                        //                   SizedBox(height: 6),
                        //                   Text(
                        //                     allGuests[index].guests,
                        //                     maxLines: 1,
                        //                     overflow: TextOverflow.ellipsis,
                        //                     style: TextStyle(
                        //                       fontWeight: FontWeight.w400,
                        //                       fontSize: 11,
                        //                     ),
                        //                   ),
                        //                 ],
                        //               ),
                        //               Spacer(),
                        //               Icon(Icons.arrow_forward_ios_rounded),
                        //             ],
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(MessagesScreen.routeName,
                                arguments: SellAllModel(
                                    invitationId: Get.arguments,
                                    guests: 'All'));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 5),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                children: [
                                  Image.asset(AppAssets.icon, height: 40),
                                  SizedBox(width: 13),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "All Guests ${(controller.eventOverviewDataList[0].all)}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Send message to all of your guests",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        GestureDetector(
                          onTap: () {
                            Get.toNamed(MessagesScreen.routeName,
                                arguments: SellAllModel(
                                    invitationId: Get.arguments,
                                    guests: 'Yes'));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 5),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                children: [
                                  Image.asset(AppAssets.icon, height: 40),
                                  SizedBox(width: 13),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Yes ${(controller.eventOverviewDataList[0].yes)}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Send message to all guests responding YES",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(MessagesScreen.routeName,
                                arguments: SellAllModel(
                                    invitationId: Get.arguments, guests: 'No'));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 5),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                children: [
                                  Image.asset(AppAssets.icon, height: 40),
                                  SizedBox(width: 13),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "No ${(controller.eventOverviewDataList[0].no)}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Send message to all guests responding NO",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(MessagesScreen.routeName,
                                arguments: SellAllModel(
                                    invitationId: Get.arguments,
                                    guests: 'Maybe'));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 5),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                children: [
                                  Image.asset(AppAssets.icon, height: 40),
                                  SizedBox(width: 13),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Maybe ${(controller.eventOverviewDataList[0].maybe)}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Send message to all guests responding MAYBE",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(Icons.arrow_forward_ios_rounded),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(MessagesScreen.routeName,
                                arguments: SellAllModel(
                                    invitationId: Get.arguments,
                                    guests: 'Pending'));
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 5),
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                children: [
                                  Image.asset(AppAssets.icon, height: 40),
                                  SizedBox(width: 13),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Pending ${(controller.eventOverviewDataList[0].panding)}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(height: 6),
                                      Text(
                                        "Send message to all of who haven’t responded yet",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class GuesModel {
  final String all;
  final String guests;

  const GuesModel({required this.all, required this.guests});
}

class SellAllModel {
  final int invitationId;
  final String guests;

  const SellAllModel({required this.invitationId, required this.guests});
}
