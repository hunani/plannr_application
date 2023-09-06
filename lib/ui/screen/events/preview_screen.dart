import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/events/send_chat_screen.dart';

import '../../../const/app_icon.dart';
import 'controller/view_invatation_controller.dart';
import 'gues_list.dart';

class PreviewScreen extends StatefulWidget {
  static const String routeName = '/previewScreen';
  const PreviewScreen({Key? key}) : super(key: key);

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  TextEditingController hostedByController = TextEditingController();
  TextEditingController contactHostController = TextEditingController();
  EventsCreateController eventsCreateController =
      Get.find<EventsCreateController>();

  void call() async {
    await eventsCreateController.invitationDataList(Get.arguments);
    hostedByController.text = eventsCreateController.inDataList!.hostedBy;
    contactHostController.text = eventsCreateController.inDataList!.phoneNumber;
    setState(() {});
  }

  @override
  void initState() {
    call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (EventsCreateController controller) {
            if (controller.isLoading) {
              return Container();
            }
            return RefreshIndicator(
              onRefresh: () async {
                eventsCreateController.invitationDataList(Get.arguments);
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(AppAssets.back, height: 55)),
                        Center(
                            child: Image.asset(
                          AppAssets.appNameImage,
                          fit: BoxFit.cover,
                          height: 70,
                        )),
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
                        "Edit Invitation",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        height: 240,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(controller.inDataList!.image,
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.inDataList!.typeOfEvent,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                width: 160,
                                height: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          blurRadius: 4),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "When",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38,
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        controller.inDataList!.startDate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: 16),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        controller.inDataList!.eventTime,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppAssets.calanderImage,
                                            height: 15,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Add to Calander",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.4),
                                          blurRadius: 4),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 20),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Where",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38,
                                            fontSize: 16),
                                      ),
                                      // SizedBox(height: 10),
                                      // Text(
                                      //   "India",
                                      //   style: TextStyle(
                                      //       fontWeight: FontWeight.w500,
                                      //       fontSize: 16),
                                      // ),
                                      // SizedBox(height: 10),
                                      Text(
                                        controller.inDataList!.location,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16),
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppAssets.peparImage,
                                            height: 15,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "View Map",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 4),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: TextFormField(
                                controller: hostedByController,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
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
                                      borderSide: BorderSide.none),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.only(top: 20, left: 15),
                                  hintText: "Hosted By",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 4),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: TextFormField(
                                controller: contactHostController,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
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
                                      borderSide: BorderSide.none),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.only(top: 20, left: 15),
                                  hintText: "Contact Host",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Who’s Comming",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 22),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(GuesListScreen.routeName,
                                      arguments: Get.arguments);
                                },
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColor.kIndigo,
                                  ),
                                  child: Center(
                                    child: Text("See All Guest",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 4),
                                ]),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Test Test",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14),
                                  ),
                                  Spacer(),
                                  Text(
                                    "1 Adult",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Additional Information",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                          SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 4),
                                ]),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: TextFormField(
                                controller: contactHostController,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                                maxLines: 5,
                                textAlignVertical: TextAlignVertical.center,
                                validator: (val) => val!.trim().isEmpty
                                    ? "field required"
                                    : null,
                                decoration: InputDecoration(
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  fillColor: Colors.white,
                                  filled: true,
                                  contentPadding:
                                      const EdgeInsets.only(top: 20, left: 15),
                                  hintText: "Test Test",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
