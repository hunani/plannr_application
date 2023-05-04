import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/sync_contact_page.dart';

import '../../../const/app_icon.dart';
import 'add_guest_screen.dart';
import 'create_contact_page.dart';

class ContactSelectScreen extends StatefulWidget {
  static const String routeName = '/contactSelectScreen';
  const ContactSelectScreen({Key? key}) : super(key: key);

  @override
  State<ContactSelectScreen> createState() => _ContactSelectScreenState();
}

class _ContactSelectScreenState extends State<ContactSelectScreen> {
  int? viewIndex;
  List<String> list = [
    "Create New contact in App",
    "View Contact",
    "SYNC Contact from Mobile to App"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                  height: 100,
                  width: 200,
                  color: Colors.transparent,
                  child: Center(
                      child: Image.asset(
                    AppAssets.appNameImage,
                    fit: BoxFit.cover,
                  ))),
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
                    "Create Invitation",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AppAssets.back,
                      height: 55,
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ...List.generate(
              list.length,
              (index) => GestureDetector(
                onTap: () {
                  viewIndex = index;
                  setState(() {});
                  if (index == 0) {
                    Get.toNamed(CreateContactPage.routeName);
                  }
                  if (index == 1) {
                    Get.toNamed(AddGuestScreen.routeName);
                  }
                  if (index == 2) {
                    Get.toNamed(SyncContactPage.routeName);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: viewIndex == index
                            ? AppColor.kIndigo
                            : Colors.white,
                        border: Border.all(
                          color: viewIndex == index
                              ? AppColor.kIndigo
                              : Colors.black,
                        )),
                    child: Center(
                      child: Text(
                        "Create New contact in App",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          color:
                              viewIndex == index ? Colors.white : Colors.black,
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
    );
  }
}
