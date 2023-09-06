import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';

import '../../../const/app_icon.dart';
import 'controller/see_all_participants_controller.dart';
import 'gues_messages_screen.dart';

class SeeAllParticipantsScreen extends StatefulWidget {
  static const String routeName = '/seeAllParticipantsScreen';
  const SeeAllParticipantsScreen({Key? key}) : super(key: key);

  @override
  State<SeeAllParticipantsScreen> createState() =>
      _SeeAllParticipantsScreenState();
}

class _SeeAllParticipantsScreenState extends State<SeeAllParticipantsScreen> {
  int? invitationId;
  String? guests;
  SellAllParticipantsController sellAllParticipantsController =
      Get.find<SellAllParticipantsController>();
  @override
  void initState() {
    SellAllModel sellAllModel = Get.arguments as SellAllModel;
    invitationId = sellAllModel.invitationId;
    guests = sellAllModel.guests;
    print("invitationId ============> $invitationId");
    print("guests ============> $guests");
    sellAllParticipantsController.seeAllParticipantsData(
        invitationId!, guests!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (SellAllParticipantsController controller) {
            return Column(
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
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "$guests",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                SizedBox(height: 30),
                controller.seeAllParticipantsList != []
                    ? Column(
                        children: List.generate(
                          controller.seeAllParticipantsList.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(
                                bottom: 20, right: 15, left: 15),
                            child: Container(
                              height: 60,
                              color: Colors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black12,
                                      ),
                                      // child: ClipRRect(
                                      //   borderRadius: BorderRadius.circular(100),
                                      //   child: Center(
                                      //     child: Image.asset(AppAssets.addGuest),
                                      //   ),
                                      // ),
                                    ),
                                    SizedBox(width: 15),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            controller
                                                .seeAllParticipantsList[index]
                                                .name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(height: 5),
                                        Text(
                                            controller
                                                .seeAllParticipantsList[index]
                                                .mobileNumber,
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                    // Spacer(),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     if (selectContactsList.contains(
                                    //         controller.createListDataList[index].id)) {
                                    //       selectContactsList.remove(
                                    //           controller.createListDataList[index].id);
                                    //     } else {
                                    //       selectContactsList.add(
                                    //           controller.createListDataList[index].id);
                                    //     }
                                    //     setState(() {});
                                    //   },
                                    //   child: Container(
                                    //     height: 30,
                                    //     width: 30,
                                    //     decoration: BoxDecoration(
                                    //       color: selectContactsList.contains(controller
                                    //               .createListDataList[index].id)
                                    //           ? AppColor.kIndigo
                                    //           : Colors.white,
                                    //       shape: BoxShape.circle,
                                    //       border: Border.all(color: Colors.black),
                                    //     ),
                                    //     child: selectContactsList.contains(
                                    //             controller.createListDataList[index].id)
                                    //         ? Icon(Icons.done,
                                    //             size: 19, color: Colors.white)
                                    //         : Container(),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 150),
                        child: Center(
                          child: Text(
                            "No Data",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 20),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
