import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/dashboad/dashboad_screen.dart';
import '../../../../const/app_icon.dart';

class YourInvitationSentScreen extends StatelessWidget {
  static const String routeName = '/yourInvitationSentScreen';
  const YourInvitationSentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Image.asset(
              AppAssets.appNameImage,
              fit: BoxFit.cover,
              height: 70,
            )),
            SizedBox(height: 20),
            Spacer(),
            Center(
              child: Text(
                "Your Invitation \nwas sent !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "You can manage this event under “event”",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(DashboadScreen.routeName);
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: Text(
                    "Go to my Events",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
