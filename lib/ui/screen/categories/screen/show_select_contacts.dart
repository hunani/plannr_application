import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/ui/screen/events/preview_details_screen.dart';
import 'package:plannr_app/ui/screen/categories/screen/preview_screen.dart';

import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';
import '../controller/contact_list_controller.dart';

class ShowSelectContactsScreen extends StatefulWidget {
  static const String routeName = '/showSelectContactsScreen';
  const ShowSelectContactsScreen({Key? key}) : super(key: key);

  @override
  State<ShowSelectContactsScreen> createState() =>
      _ShowSelectContactsScreenState();
}

class _ShowSelectContactsScreenState extends State<ShowSelectContactsScreen> {
  ContactListController contactListController =
      Get.find<ContactListController>();
  int? id;
  @override
  void initState() {
    id = Get.arguments;
    print("==========mmm=> ${id}");
    contactListController.invitationSend(Get.arguments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (ContactListController controller) {
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
                SizedBox(height: 15),
                Center(
                  child: Text(
                    "All Guests (11)",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                ),
                SizedBox(height: 30),
                ...List.generate(
                  controller.invitationSendList.length,
                  (index) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 15, left: 15),
                    child: Container(
                      height: 60,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          children: [
                            Image.asset(AppAssets.profile, height: 48),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.invitationSendList[index].name,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 5),
                                Text(
                                    controller
                                        .invitationSendList[index].mobileNumber,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Icon(Icons.done,
                                      size: 19, color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(PreviewViewScreen.routeName);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Spacer(),
                          Text(
                            "Continue to Preview",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
