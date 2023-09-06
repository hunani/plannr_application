import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/profile/controller/faq_controller.dart';

import '../../../const/app_icon.dart';

class FaqScreen extends StatefulWidget {
  static const String routeName = '/faqScreen';
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  bool view = false;
  bool view2 = false;
  bool view3 = false;
  bool view4 = false;
  bool view5 = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        backgroundColor: AppColor.kScreenColor,
        body: SafeArea(
          child: GetBuilder(
            builder: (FaqController controller) {
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
                        "Frequently Asked Questions",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 22),
                      ),
                    ),
                    SizedBox(height: 20),
                    ...List.generate(
                        controller.faqDataList.length,
                        (index) => Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    if (controller.faqDataList[index].view ==
                                        "false") {
                                      controller.faqDataList[index].view =
                                          "true";
                                    } else {
                                      controller.faqDataList[index].view =
                                          "false";
                                    }

                                    setState(() {});
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    height: 50,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: AppColor.kIndigo),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          Text(
                                            controller.faqDataList[index].title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14),
                                          ),
                                          Spacer(),
                                          controller.faqDataList[index].view ==
                                                  "false"
                                              ? Icon(
                                                  Icons.keyboard_arrow_down,
                                                  size: 20,
                                                  color: Colors.black,
                                                )
                                              : Icon(
                                                  Icons.keyboard_arrow_up_sharp,
                                                  size: 20,
                                                  color: Colors.black,
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                controller.faqDataList[index].view == "false"
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 15),
                                        child: Container(),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 15,
                                            bottom: 15),
                                        child: Text(
                                          controller
                                              .faqDataList[index].description,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                      ),
                              ],
                            )),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
