import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_icon.dart';

void shareBottomSheet() async {
  Get.bottomSheet(
    const ShareBottomSheet(),
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

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Text(
                "Manage Guest",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(AppAssets.remove, height: 16)),
            ],
          ),
        ),
        Divider(thickness: 1.5),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.text, height: 80),
            SizedBox(width: 20),
            Image.asset(AppAssets.link, height: 80),
          ],
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
