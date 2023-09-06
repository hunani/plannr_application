import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plannr_app/ui/screen/categories/screen/pay_screen.dart';
import '../../../../const/app_color.dart';
import '../../../../const/app_icon.dart';

class PreviewPaymentScreen extends StatelessWidget {
  static const String routeName = '/previewPaymentScreen';
  const PreviewPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: SingleChildScrollView(
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
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(AppAssets.homeImage5),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                          width: double.infinity,
                          color: Color(0xfff7f3eb),
                          child: Image.asset(
                            AppAssets.homeImage7,
                            fit: BoxFit.cover,
                          )),
                    ),
                    SizedBox(height: 100),
                    const Text(
                      "Additional Features Added:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: const [
                        Text(
                          "Chat Room",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Text(
                          "\$2.99",
                          style: TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: Text("Currently not included in your plan"),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("You're Purchasing 1 Chat room For your event"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("This Fees is non-refundable"),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(PaymentScreen.routeName);
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.transparent,
                            ),
                            Text(
                              "Continue to Payment",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
