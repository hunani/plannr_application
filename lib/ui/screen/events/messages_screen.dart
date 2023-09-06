import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/events/see_all_participants_screen.dart';

import '../../../const/app_icon.dart';
import 'gues_messages_screen.dart';

class MessagesScreen extends StatefulWidget {
  static const String routeName = '/messagesScreen';
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  int? invitationId;
  String? guests;
  @override
  void initState() {
    SellAllModel sellAllModel = Get.arguments as SellAllModel;
    invitationId = sellAllModel.invitationId;
    guests = sellAllModel.guests;
    print("invitationId ============> $invitationId");
    print("guests ============> $guests");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
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
                    "Messages",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Spacer(),
                  PopupMenuButton(
                    child: Icon(Icons.more_vert_outlined),
                    onSelected: (value) {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    itemBuilder: (context) => <PopupMenuItem<String>>[
                      PopupMenuItem(
                          child: GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            SeeAllParticipantsScreen.routeName,
                            arguments: SellAllModel(
                                invitationId: invitationId!, guests: guests!),
                          );
                        },
                        child: Column(
                          children: [
                            Text("See All Participants"),
                          ],
                        ),
                      )),
                    ],
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
            SizedBox(height: 20),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Image.asset(
                    AppAssets.messages,
                    height: 120,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "This is a broadcast list with All Guests. Messages are sent to each guest privately",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "View List Of All Guests",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 100),
                  TextFormField(
                    maxLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
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
                      contentPadding: const EdgeInsets.only(top: 20, left: 15),
                      hintText: "Write a Message",
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.kIndigo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
