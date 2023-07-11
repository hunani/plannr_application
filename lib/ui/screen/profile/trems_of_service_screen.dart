import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/const/dispose_keyboard.dart';
import 'package:plannr_app/ui/screen/profile/controller/faq_controller.dart';

import '../../../const/app_icon.dart';
import 'controller/terms_of_service_controller.dart';

class TermsOfServiceScreen extends StatefulWidget {
  static const String routeName = '/termsOfServiceScreen';
  const TermsOfServiceScreen({Key? key}) : super(key: key);

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
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
            builder: (TermsOfServiceController controller) {
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
                          "Terms Of Service",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
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
                    ...List.generate(
                      controller.termsOfServiceDataList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Html(
                          data:
                              controller.termsOfServiceDataList[index].content,
                          style: {
                            "body": Style(
                              fontSize: FontSize(14),
                              fontWeight: FontWeight.w300,
                              margin: EdgeInsets.only(bottom: 20),
                            ),
                          },
                        ),
                      ),
                    ),
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
