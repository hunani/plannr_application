import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/ui/screen/profile/controller/contact_us_controller.dart';

class ContactUsScreen extends StatefulWidget {
  static const String routeName = '/contactScreen';
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (ContactUsController controller) {
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
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            AppAssets.back,
                            height: 55,
                            color: Colors.transparent,
                          )),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Contact Us",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: List.generate(
                        controller.contactUsDataList.length,
                        (index) => Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Html(
                                data:
                                    controller.contactUsDataList[index].content,
                                style: {
                                  "body": Style(
                                    fontSize: FontSize(15),
                                    fontWeight: FontWeight.w300,
                                    margin: EdgeInsets.only(bottom: 20),
                                  ),
                                },
                              ),
                            ),
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
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
