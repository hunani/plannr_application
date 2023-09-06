import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:plannr_app/const/app_color.dart';
import 'package:plannr_app/ui/screen/categories/screen/pay_screen.dart';

import '../../../../const/app_icon.dart';
import '../controller/additional_fetures_controller.dart';
import 'contacts_select_screen.dart';

class AdditionalFeaturesScreen extends StatefulWidget {
  static const String routeName = '/additionalFeaturesScreen';
  const AdditionalFeaturesScreen({Key? key}) : super(key: key);

  @override
  State<AdditionalFeaturesScreen> createState() =>
      _AdditionalFeaturesScreenState();
}

class _AdditionalFeaturesScreenState extends State<AdditionalFeaturesScreen> {
  List<String> yesNoList = ["Yes", "No"];
  int? yesNoIndex;
  int? yesNoIndex2;
  int? productId;
  @override
  void initState() {
    productId = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kScreenColor,
      body: SafeArea(
        child: GetBuilder(
          builder: (AdditionalFeaturesController controller) {
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Center(
                        child: Text(
                          "Additional Features",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ...List.generate(
                        controller.additionalFeaturesDataList.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.additionalFeaturesDataList[index]
                                        .title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  Text(
                                    "\$${controller.additionalFeaturesDataList[index].price.toString()}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(PaymentScreen.routeName, arguments: productId);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        "Continue to Guests",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
