import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';

void bottomSheet() async {
  Get.bottomSheet(
    const ContactShareBottomSheet(),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
    ),
  );
}

class ContactShareBottomSheet extends StatelessWidget {
  const ContactShareBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 30),
        Row(
          children: [
            Spacer(),
            InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(AppAssets.remove, height: 18)),
            SizedBox(width: 20),
          ],
        ),
        SizedBox(height: 5),
        Divider(thickness: 1.5),
        Text(
          "https://planner.co/hash/5fbALBPV/1/share",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColor.kIndigo),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.copyImage, height: 13),
                  SizedBox(width: 5),
                  Text(
                    "Copy",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.kIndigo),
                  ),
                ],
              ),
            ),
            SizedBox(width: 30),
            Container(
              height: 30,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: AppColor.kIndigo),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share, size: 15, color: AppColor.kIndigo),
                  SizedBox(width: 5),
                  Text(
                    "Nearby",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColor.kIndigo),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                4,
                (index) => Column(
                      children: [
                        Container(
                          height: 64,
                          width: 64,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Center(
                              child: Image.asset(AppAssets.addGuest),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Purple haze",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )),
          ),
        ),
        SizedBox(height: 20),
        Divider(thickness: 2.5, color: Colors.white),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppAssets.intagramImage, height: 55),
              Image.asset(AppAssets.facebook2Image, height: 55),
              Image.asset(AppAssets.linkdinImage, height: 55),
              Image.asset(AppAssets.whatappImage, height: 55),
            ],
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
