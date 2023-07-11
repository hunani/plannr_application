import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/app_icon.dart';
import 'package:plannr_app/ui/screen/profile/controller/contact_us_controller.dart';

class ContactScreen extends StatefulWidget {
  static const String routeName = '/contactScreen';
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: GetBuilder(
        builder: (ContactUsController controller) {
          if (controller.isLoading) {
            return Container();
          }
          return SingleChildScrollView(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Image.asset(AppAssets.back, height: 55)),
                    Text(
                      "Contact Us",
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
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Html(
                              data: controller.contactUsDataList[index].content,
                              style: {
                                "body": Style(
                                  fontSize: FontSize(14),
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
    );
  }
}
