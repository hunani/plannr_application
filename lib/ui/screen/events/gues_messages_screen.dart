import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../const/app_color.dart';
import '../../../const/app_icon.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                      "Messages",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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
              SizedBox(height: 20),
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
                              ),
                            )
                            .values
                            .toList(),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Messages",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(MessagesScreen.routeName);
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
                              Image.asset(AppAssets.icon, height: 40),
                              SizedBox(width: 13),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "All Guests",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Send message to all of your guets",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
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
        ),
      ),
    );
  }
}
